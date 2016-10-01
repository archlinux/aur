# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=whereami
pkgver=0.3.40
pkgrel=1
pkgdesc="Uses WiFi signals and machine learning to predict where you are"
url='https://github.com/kootenpv/whereami'
arch=('any')
license=('MIT')
depends=('python' 'python-access_points' 'python-tqdm' 'python-scikit-learn')
source=('https://pypi.python.org/packages/47/d2/929c446e39facbc51ec555c20c2d5e54664e6cbb35849ed97e1a06c513f6/'$pkgname'-'$pkgver'.tar.gz')
md5sums=('2b87a2bfc1fe7725ff1e9036e0be0b4f')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
