# Maintainer: Philip May <eniak.info@gmail.com>
# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>

pkgname=python-configparser
_pkgname=configparser
pkgver=7.2.0
pkgrel=1
pkgdesc="Backport of configparser from Python's stdlib."
arch=('any')
url='https://github.com/jaraco/configparser/'
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools-scm'
	'git'
)
source=("git+https://github.com/jaraco/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('f89031fa5900228f02bf22995a5a94ac68a5d3c23496e019b14ac9149d996e65')

build() {
	cd "${srcdir}/${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
