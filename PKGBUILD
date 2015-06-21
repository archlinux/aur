# Maintainer:  <clu>

pkgname=stiff  
pkgver=2.1.3
pkgrel=2
pkgdesc="is a program that converts scientific FITS images to the more popular TIFF format for illustration purposes."
url="http://www.astromatic.net/software/stiff"
arch=('i686' 'x86_64')
license=('custom')
depends=('libtiff>=3.6' 'libjpeg>=6.0' 'zlib>=1.2')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.astromatic.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('a5424ab71865a5e5a7a600fa27566771a4e5e273')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/share/licenses/stiff
  install -Dm644 $srcdir/$pkgname-$pkgver/COPYRIGHT \
          $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
