# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=whereami
pkgver=0.4.69
pkgrel=2
pkgdesc="Uses WiFi signals and machine learning to predict where you are"
url='https://github.com/kootenpv/whereami'
arch=('any')
license=('MIT')
depends=('python' 'python-access_points>=0.4.56' 'python-tqdm' 'python-scikit-learn')
source=('https://pypi.python.org/packages/df/08/68b382377ea7773a98032b02cb36b48fb4da044d403c12322bce5d91dfbb/'$pkgname'-'$pkgver'.tar.gz')
md5sums=('5e9b6a07525cfa11f926aa6a185bdfb5')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
