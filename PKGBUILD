# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=gamera
pkgver=3.4.2
pkgrel=1
pkgdesc="Framework for building document analysis applications."
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gamera.informatik.hsnr.de"
license=('GPL')
depends=('python2' 'libtiff' 'libpng')
source=(https://github.com/hsnr-gamera/gamera/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz)
sha512sums=('f565c6bd0378e9d207bea0662cdfa5c247907bbbe51dbfcaa923ba3acee96c4169a3a96832499d437e32a7c9c055cd9ed9e54184fc64176eb06869de36a8887f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}
