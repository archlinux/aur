# Maintainer: Andrey Mivrenik <gim at fastmail dot fm>
pkgname=matio
pkgver=1.5.2
pkgrel=1
pkgdesc='A C library for reading and writing Matlab MAT files.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/matio/'
license=('BSD')
depends=('zlib' 'hdf5')
source=("$pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/matio/files/matio/1.5.2/matio-${pkgver}.tar.gz/download")
sha256sums=('db02d0fb3373c3d766a606309b17e64a5d8da55610e921a9f1a0ec171e911d45')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-mat73=yes \
              --with-default-api-version=v18
  make
  #make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
