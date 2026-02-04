# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.3.6
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('x86_64')
url='https://tuiview.org/'
license=('GPL2')
depends=('python-setuptools' 'python-numpy' 'python-gdal' 'pyside6' 'python' 'glibc' 'gdal')
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
source=("https://github.com/ubarsc/tuiview/archive/tuiview-$pkgver.tar.gz")
sha256sums=('5f25363520d29f4bebb1c852c07c84bfcdbdabb5b11cce353219d77bf28a3122')

package() {
  cd "$srcdir/tuiview-tuiview-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
