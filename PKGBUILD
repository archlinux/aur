# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=skorch
pkgname=python-$_pkgname
pkgver=0.9.0
pkgrel=1
pkgdesc="A scikit-learn compatible neural network library that wraps pytorch"
arch=('any')
url="https://github.com/skorch-dev/skorch"
license=('BSD3')
depends=(
	'python-numpy'
	'python-pytorch'
	'python-scikit-learn'
	'python-scipy'
	'python-tabulate'
	'python-tqdm'
	'python-yaml'
)
makedepends=('python-setuptools')
source=("https://github.com/skorch-dev/skorch/archive/v${pkgver}.tar.gz")
sha256sums=('535f41986e58d42335acb0c57d342657ad4d59619d39b98ee4802b42a6dc3fbd')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
