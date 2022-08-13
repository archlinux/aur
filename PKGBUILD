
pkgname=python-scikit-optimize
pkgver=0.9.0
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="https://scikit-optimize.github.io"
license=('BSD')
depends=(
	'python>=3.6'
	'python-numpy>=1.13.3'
	'python-scipy>=0.19.1'
	'python-joblib>=0.11'
	'python-scikit-learn>=0.20'
	'python-matplotlib>=2.0.0'
)
makedepends=('python-setuptools')
source=("https://github.com/scikit-optimize/scikit-optimize/archive/v${pkgver}.tar.gz")
sha256sums=('b5602b22c7aacabe3afd36619f662d1f287f2e3fe9a5aa19bbc83f851b30b7bf')

build() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

