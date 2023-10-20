# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.2.13
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('x86_64')
url='http://tuiview.org'
license=('GPL2')
depends=('python-setuptools' 'python-numpy' 'python-gdal' 'python-pyqt5')
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
source=("https://github.com/ubarsc/tuiview/archive/tuiview-$pkgver.tar.gz")
sha256sums=('afcefb9e1e09afd38c70e04ff647cb3b836cec9476461f41878836a4315e389b')

package() {
  cd "$srcdir/tuiview-tuiview-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
