# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname='catalogue'
pkgname="python-${_pkgname}"
pkgver=2.0.2
pkgrel=1
pkgdesc='Super lightweight function registries for your library'
arch=('any')
url='https://github.com/explosion/catalogue'
_url_pypi='https://pypi.org/project/catalogue'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ead4e8ad26898ff2f2e666d7a815abc55923a33b26b0b651dcc46a87dc5a6a47')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
