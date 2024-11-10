# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Philip Goto <philip.goto@gmail.com> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=catalogue
pkgname="python-${_pkgname}"
pkgver=2.0.10
pkgrel=1
pkgdesc='Super lightweight function registries for your library'
arch=(any)
url='https://github.com/explosion/catalogue'
license=(MIT)
depends=(
  python
  python-pytest
  python-zipp
  python-typing_extensions
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('f3bcd13ca8d5eacf625f96e5ab82a6a20bf9d7fc1de757c08be5eccd8ff873430ec5c9e0bdc91ae84aae130ae80416e61aae4340179de23a8684a8d8c31059ef')

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
