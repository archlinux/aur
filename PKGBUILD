# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=xdg-ninja-git
_pkgname=xdg-ninja
pkgver=r324.619f172
pkgrel=2
pkgdesc='A shell script which checks your $HOME for unwanted files and directories.'
arch=('any')
url="https://github.com/b3nj5m1n/${_pkgname}"
license=('MIT')
depends=('jq' 'bc')
makedepends=('git')
optdepends=(
  'glow: rendering markdown in the terminal'
)
provides=('xdg-ninja')
conflicts=('xdg-ninja')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" PREFIX="/usr" make install
}

