# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.4.0
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libftdi' 'libserialport' 'python' 'glibmm' 'libzip')
makedepends=('doxygen' 'swig')
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6cd64b94be0b8ce7224de8c823f735aa')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-ruby --disable-java

  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
