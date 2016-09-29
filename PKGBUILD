# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=whereami
pkgver=0.2.29
pkgrel=1
pkgdesc="Uses WiFi signals and machine learning to predict where you are"
url='https://github.com/kootenpv/whereami'
arch=('any')
license=('MIT')
depends=('python' 'python-access_points' 'python-tqdm' 'python-scikit-learn')
source=('https://pypi.python.org/packages/82/54/ce860ee6a4af80dd2bf52b58e6852be33d484536b44a86b9bfc22416b651/'$pkgname'-'$pkgver'.tar.gz#')
md5sums=('6d965a0049db9daf5bbf6526caa10ab9')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
