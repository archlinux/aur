
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-toggler-git
_pkgname=${pkgname%-git}
pkgver=r1.9542323
pkgrel=1
pkgdesc='Improved versions of <C-a>, <C-x>, ~, g~, gu, and gU.'
arch=('any')
url='https://repo.or.cz/vis-toggler.git'
license=('unknown')
depends=('vis')
provides=('vis-toggler')
conflicts=('vis-toggler')
source=("git+https://repo.or.cz/vis-toggler.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"

    cd "$srcdir/$_pkgname"
    install -dv "$vispath/vis-toggler"
    cp init.lua defaults.lua "$vispath/vis-toggler"
}
