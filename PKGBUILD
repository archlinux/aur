# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=libdv-gtk2
pkgver=1.0.0
pkgrel=2
pkgdesc="The Quasar DV codec but with a gtk2 frontend"
arch=('i686' 'x86_64')
url="http://libdv.sourceforge.net/"
license=('LGPL')
depends=('popt')
makedepends=('pkgconfig' 'gtk2' 'libxv')
optdepends=('gtk2: for using playdv' 'libxv: for using playdv')
options=('!libtool')
source=(gtk2.patch http://downloads.sourceforge.net/libdv/libdv-$pkgver.tar.gz)

build() {
  cd "$srcdir"/libdv-$pkgver
  patch -Np1 -i ../gtk2.patch
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/libdv-$pkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('4c7d6675dba9445643336147f427cb99' 'f895162161cfa4bb4a94c070a7caa6c7')
