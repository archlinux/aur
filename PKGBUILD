# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-optimesh
pkgdesc="Mesh optimization, mesh smoothing"
pkgver=0.9.0
pkgrel=1
arch=('any')
url="https://pypi.org/project/optimesh"
license=('custom:proprietary')
depends=('python>=3.7' 'python-meshio' 'python-meshplex' 'python-numpy' 'python-npx' 'python-x21')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pynacl')
optdepends=('python-matplotlib: for Matplotlib rendering')
provides=('optimesh' 'optimesh-info')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/o/optimesh/optimesh-$pkgver.tar.gz")
sha256sums=('34a40d017fb5e75b47392a903f100e88b43dbc0710ed4b1349f126336eae4046')

build() {
	cd "optimesh-$pkgver"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	export PYTHHONHASHSEED=0
	cd "optimesh-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
