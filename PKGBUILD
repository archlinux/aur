# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.2.6
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('x86_64')
url='http://tuiview.org'
license=('GPL2')
depends=('python-numpy' 'python-gdal' 'python-pyqt5')
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
source=("https://github.com/ubarsc/tuiview/archive/tuiview-$pkgver.tar.gz")
sha256sums=('a27fce7f6099df79922cc24a4fb29b5774229bc23988e52016045ffc5e225455')

package() {
  cd "$srcdir/tuiview-tuiview-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
