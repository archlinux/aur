# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=xdg-ninja-git
_pkgname=xdg-ninja
pkgver=r324.619f172
pkgrel=1
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
    install -vDm 755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
    mkdir -p "$pkgdir/usr/share/$_pkgname/"
    cp -r programs/ "$pkgdir/usr/share/$_pkgname/"
}

