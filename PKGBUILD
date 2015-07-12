# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Christer Stenbrenden <christer.stenbrenden@gmail.com>

pkgname=mdbus2
pkgver=2.3.3
pkgrel=1
epoch=1
pkgdesc='DBus introspection command utility'
url='http://www.freesmartphone.org/'
license=('GPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('vala')
depends=('dbus-glib')
source=("http://downloads.sourceforge.net/project/freesmartphone/sources/mdbus2-${pkgver}.tar.bz2")
sha256sums=("a7ecc11b596e022ac09748eb883437bdcfa09005a441a3f933ffcbcdad47f05f")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-vala
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
