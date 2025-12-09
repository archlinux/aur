# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python-kodi_six
pkgver=0.1.3.1
pkgrel=1
pkgdesc='Experimental library created to simplify porting Kodi Python addons to Python 3.'
url='https://github.com/romanvm/kodi.six'
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
arch=('any')
sha256sums=('dcc69406a09a272bd98f6f523aece3cad1b385c0cbf90a1261bc7b0bea81b96d')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

_srcdir="kodi.six-${pkgver}"

build() {
	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=('kodi')

	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
