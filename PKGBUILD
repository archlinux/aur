# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=python-spython
pkgver=0.1.17
pkgrel=1
pkgdesc="CLI tool for working with Singularity Python"
arch=('any')
url="https://singularityhub.github.io/singularity-cli/"
license=('MPL2')
depends=('python-requests' 'python-semver')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/spython/spython-$pkgver.tar.gz")
sha256sums=('00991fa848c6787ffbb7dfa6efc67cc80cb5214b5faf7124515c92f4bb02de3e')

build() {
	cd "spython-$pkgver"
	python setup.py build
}

check() {
	cd "spython-$pkgver"
	python setup.py pytest
}

package() {
	cd "spython-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
