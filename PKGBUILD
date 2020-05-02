# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=skorch
pkgname=python-$_pkgname
pkgver=0.8.0
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
sha256sums=('0619c6b1e53ac55be35ea03f072ed4796ecfa1426abfad8784a1868dbdf03bf4')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
