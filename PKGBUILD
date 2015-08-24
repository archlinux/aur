# Maintainer : Dr-Shadow <xxdrshadowxx@gmail.com>

pkgname=netsoul-purple
pkgver=0.3
pkgrel=0
pkgdesc="Protocol Plugin (prpl) for libpurple, this plugin provide netsoul IM protocol"
url="http://projects.irq6.net/projects/netsoul-purple"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libpurple')
provides=('netsoul-purple')
conflicts=('netsoul-purple')
makedepends=()
source=('http://git.irq6.net/netsoul-purple.git/snapshot/netsoul-purple-0.3.0.tar.gz')
md5sums=('d54154fb4e14435b0412fbc1b0e7e8ce')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}.${pkgrel}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}.${pkgrel}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
