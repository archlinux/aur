
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-pairs-git
_pkgname=${pkgname%-git}
pkgver=r75.8d2e4ee
pkgrel=1
pkgdesc='Textobjects and motions for delimited blocks.'
arch=('any')
url='https://repo.or.cz/vis-pairs.git'
license=('unknown')
depends=('vis')
provides=('vis-pairs')
conflicts=('vis-pairs')
source=("git+https://repo.or.cz/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"

    cd "$srcdir/$_pkgname"
    install -Dm644 init.lua "$vispath/pairs/init.lua"
}
