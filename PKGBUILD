# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=xdg-ninja-git
_pkgname=xdg-ninja
pkgver=r37.6e5dea2
pkgrel=1
pkgdesc='A shell script which checks your $HOME for unwanted files and directories.'
arch=('any')
url="https://github.com/b3nj5m1n/${_pkgname}"
license=('GPL3')
depends=('jq' 'bc')
makedepends=('git')
optdepends=(
  'glow: rendering markdown in the terminal'
)
provides=('xdg-ninja')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -vDm 755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
}

