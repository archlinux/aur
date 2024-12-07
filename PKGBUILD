
pkgname=python-scikit-optimize
pkgver=0.10.2
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="https://scikit-optimize.readthedocs.io"
license=('BSD')
depends=(
	'python>=3.8'
	'python-numpy>=1.20.3'
	'python-scipy>=1.1.1'
	'python-joblib>=0.11'
	'python-scikit-learn>=1.0.0'
	'python-matplotlib>=2.0.0'
	'python-pyaml>=16.9'
)
makedepends=('python-setuptools')
source=("https://github.com/holgern/scikit-optimize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('009a3d0b7715844276c3ca63a97eee638c5a65d5858642901aa6d76a874a71cf')

build() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

