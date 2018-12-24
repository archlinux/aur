# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=trimage
pkgver=1.0.5
pkgrel=3
pkgdesc="A GUI based lossless image compressor."
url="http://trimage.org"
arch=('any')
license=('custom:MIT')
depends=('python2-pyqt4' 'python2-sip-pyqt4' 'optipng' 'pngcrush' 'advancecomp' 'jpegoptim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kilian/Trimage/archive/${pkgver}.zip")
md5sums=('5d596c19c36773d6c94c3633763f603c')

prepare() {
  cd Trimage-$pkgver  
  sed -i '1s|python|python2|g' $pkgname src/$pkgname/$pkgname.py
}

package() {
  cd Trimage-$pkgver
  python2 setup.py install --root="${pkgdir}"  --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
