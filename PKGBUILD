# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.12
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=(
	'python>=3.8.0'
	'python-skyfield'
	'python-skyfield-data'
	'python-dateutil'
)

makedepends=(
	'python-poetry-core'
	'python-build'
	'python-installer'
	'python-wheel'
)

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/Kosmorro/lib/tar.gz/refs/tags/v${pkgver}")
sha256sums=("59e81d7c1c24ce7e39ae1d60b826b60d61884b87e8726d436e50a881be514478")

build() {
	cd "${srcdir}/lib-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/lib-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

