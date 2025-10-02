# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-deezer-py
_pkgname=deezer-py
pkgver=1.3.7
pkgrel=5
pkgdesc="A wrapper for all Deezer's APIs"
url="https://gitlab.com/RemixDev/deezer-py"
arch=('any')
license=('GPL-3.0-or-later')
# The two projects unfortunately use the same
# project name and some file names like utils.py
conflicts=('python-deezer')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer')
# The project is abandoned and release was not tagged, so let's use the commit
_gittag="12e26328e8aa44430e36f96d0a32e52a410e76a5"
source=("${_pkgname}-${pkgver}.tar.gz::https://gitlab.com/RemixDev/deezer-py/-/archive/${_gittag}/${_pkgname}-${_gittag}.tar.gz")
sha256sums=('8beedba302f68b90435c6c7be3032ad80c1bd922218d01d0d942c549f1b12823')

build() {
	cd "${srcdir}/${_pkgname}-${_gittag}"
	python -m build
}

package() {
	cd "${srcdir}/${_pkgname}-${_gittag}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
