# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.3.4
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('x86_64')
url='http://tuiview.org'
license=('GPL2')
depends=('python-setuptools' 'python-numpy' 'python-gdal' 'pyside6' 'python' 'glibc' 'gdal')
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
source=("https://github.com/ubarsc/tuiview/archive/tuiview-$pkgver.tar.gz")
sha256sums=('bcaac7e31837c77d3c34f741e22d051651a6f010591509d41f879e0b4b406995')

package() {
  cd "$srcdir/tuiview-tuiview-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
