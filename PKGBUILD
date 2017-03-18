# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=gamera
pkgver=3.4.3
pkgrel=1
pkgdesc="Framework for building document analysis applications."
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gamera.informatik.hsnr.de"
license=('GPL')
depends=('python2' 'libtiff' 'libpng')
source=(https://github.com/hsnr-gamera/gamera/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz)
sha512sums=('accd5a534b529dccdf7d2c8a3aa652a132fc5639407e1026d30a32348d1cb83dae0669d3b5de55f1630788cc03d4ba2b8a3d19bd8ae6e5119f27fe63764af002')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}
