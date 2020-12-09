
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-surround-git
_pkgname=${pkgname%-git}
pkgver=r1.635a0a9
pkgrel=1
pkgdesc='Operators for adding/changing/deleting pairs of block delimiters.'
arch=('any')
url='https://repo.or.cz/vis-surround.git'
license=('unknown')
depends=('vis')
optdepends=('vis-pairs: more textobjects delimeters')
provides=('vis-surround')
conflicts=('vis-surround')
source=("git+https://repo.or.cz/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"

    cd "$srcdir/$_pkgname"
    install -Dm644 init.lua "$vispath/vis-surround/init.lua"
}
