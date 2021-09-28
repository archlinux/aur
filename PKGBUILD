# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=pyclip
pkgname=python-${_pkgname}
pkgver=0.5.4
pkgrel=1
pkgdesc='Cross-platform clipboard utilities supporting both binary and text data'
url='https://pypi.org/project/${_pkgname}/'
depends=(python)
makedepends=(python-setuptools)
license=(Apache)
arch=(any)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/spyoungtech/pyclip/archive/refs/tags/v${pkgver}.tar.gz")
# source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('18771cf7a98e076817fcbb87ba8e56767d23df8a42a7eee9dde4866a98f49890')


build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
