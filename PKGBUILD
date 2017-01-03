# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=affine
pkgname=('python2-affine')
pkgver=2.0.0.post1
pkgrel=1
pkgdesc="Matrices describing affine transformation of the plane (Python 2.7)"
arch=('any')
url='https://github.com/sgillies/affine'
license=('BSD')
makedepends=('python2-setuptools')
options=(!emptydirs)
md5sums=('b7f4e2c86adc6575a7563c401d07f992'
         '75dd4e368ae6aeef7f6ab3f8e8e796a8')
_pypi='https://pypi.python.org/packages'
_path='b0/3c/e1a37f1e92f27f5e32371b572201819c59d5e917d600d46df80f780cab43'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz#md5=$md5sums"
  "https://raw.githubusercontent.com/sgillies/affine/$pkgver/LICENSE.txt")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
