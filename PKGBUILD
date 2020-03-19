# Maintainer: Fredrick Brennan <copypaste at kittens dot ph>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=trimage
pkgver=1.0.6
pkgrel=2
pkgdesc="A GUI based lossless image compressor."
url="http://trimage.org"
arch=('any')
license=('custom:MIT')
depends=('python-pyqt5' 'optipng' 'pngcrush' 'advancecomp' 'jpegoptim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kilian/Trimage/archive/${pkgver}.zip")
md5sums=('3806d2939a5834df0b6f76dd374ed744')

package() {
  cd Trimage-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
