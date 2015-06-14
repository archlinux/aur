# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libserialport
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal, cross-platform shared library for sigrok, intended to take care of the OS-specific details when writing software that uses serial ports"
arch=('i686' 'x86_64')
url="http://sigrok.org/wiki/Libserialport"
license=('GPL3')
depends=('libsystemd')
provides=('libserialport')
conflicts=('libserialport')
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('750fa8dc1baf26b42fb4cadd9327674b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
