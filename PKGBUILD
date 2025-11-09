# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.13
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
sha256sums=("d63e0cf8f58844efc73ea6b138be717b7cda57aeb6e6ce1a3e2a1a635513e06f")

build() {
	cd "${srcdir}/lib-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/lib-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

