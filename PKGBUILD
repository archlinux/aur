# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libmatio
pkgver=1.5.2
pkgrel=3
pkgdesc='C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files'
arch=('x86_64' 'i686')
license=('custom:BSD')
url='http://sourceforge.net/projects/matio'
depends=('zlib' 'hdf5')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/matio/matio-$pkgver.tar.gz")
sha1sums=('d5a83a51eb2550d75811d2dde967ef3e167d4f52')

build() {
  cd matio-$pkgver
  ./configure --prefix=/usr --enable-shared --with-hdf5
  make
}
 
package() {
  cd matio-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
