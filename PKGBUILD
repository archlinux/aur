# Maintainer: Philip May <eniak.info@gmail.com>
# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>

pkgname=python-configparser
_pkgname=configparser
pkgver=7.1.0
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
sha256sums=('4a27ed6254dc4858774c6c02f224f283477942278510094c49dd8108b27b8fa5')

build() {
	cd "${srcdir}/${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
