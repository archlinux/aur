# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-sdbus-notifications
pkgver=1.0.3
pkgrel=2
pkgdesc="Freedesktop Notifications binds for python-sdbus"
url="https://github.com/python-sdbus/python-sdbus-notifications"
arch=('any')
license=('LGPL-2.1-or-later')
depends=(
	'python-sdbus'
)
optdepends=(
)
makedepends=(
	'git'
	'python-poetry'
	'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python-sdbus/python-sdbus-notifications/archive/${pkgver}.tar.gz")
sha256sums=('076bdabb698a72380e104c9bbe367af948153dcaafd64cdab3f866319046f501')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
