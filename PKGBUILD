# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=whereami
pkgver=0.4.85
pkgrel=2
pkgdesc="Uses WiFi signals and machine learning to predict where you are"
url='https://github.com/kootenpv/whereami'
arch=('any')
license=('MIT')
depends=('python' 'python-access_points>=0.4.56' 'python-tqdm' 'python-scikit-learn')
source=('https://files.pythonhosted.org/packages/3e/f1/bcefa141e13bd9d19ca8360bc5557bd7d97ac9677e5f26212e7d6b4b7120/'$pkgname'-'$pkgver'.tar.gz')
md5sums=('a9cd5aba8e91e8bb4f6d69e6c81e45f5')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
