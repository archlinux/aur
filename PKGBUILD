# Maintainer: Peter Gergel <gergelp@gmail.com>
pkgname=kbang
pkgver=0.1.3
pkgrel=4.4
pkgdesc='Open source implementation (client, server) of the popular card game Bang!'
arch=('x86_64')
license=('GPL')
makedepends=('qt4' 'libpng' 'freetype2' 'expat' 'graphite')
source=('http://download.opensuse.org/repositories/games/openSUSE_Leap_42.2/x86_64/kbang-0.1.3-4.4.x86_64.rpm')
sha256sums=('f09064e8739023581289d85f86df04af148d44b81cb8e83783f6f6996db68f7b')

package() {
    cd "${srcdir}/usr"
    install -dm755 "${pkgdir}"/usr/{bin,share/{applications,doc/packages/$pkgname,$pkgname/gfx/{cards,characters},pixmaps}}

    install -Dm755 bin/* "${pkgdir}/usr/bin"

    cd share
    install -Dm644 applications/* "${pkgdir}"/usr/share/applications
    install -Dm644 doc/packages/$pkgname/* "${pkgdir}"/usr/share/doc/packages/$pkgname
    install -Dm644 $pkgname/gfx/cards/* "${pkgdir}"/usr/share/$pkgname/gfx/cards
    install -Dm644 $pkgname/gfx/characters/* "${pkgdir}"/usr/share/$pkgname/gfx/characters
    install -Dm644 pixmaps/* "${pkgdir}"/usr/share/pixmaps
}
