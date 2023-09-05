# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
# Maintainer: Philip May <eniak.info@gmail.com>

pkgname=python-configparser
_pkgname=configparser
pkgver=6.0.0
pkgrel=1
pkgdesc='backport of configparser from Python 3'
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
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
