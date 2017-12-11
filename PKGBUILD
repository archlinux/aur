# Maintainer:  <clu>

pkgname=stiff  
pkgver=2.4.0
pkgrel=1
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
sha1sums=('4554772a432d1f6c3779933c1971469b81526b14')

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
