# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=nest_asyncio
pkgname=python-${_pkgname}
pkgver=1.2.0
_pkgver='60af56f5333de2c3fe9a0ac3d416f466356a2198'
pkgrel=1
pkgdesc="Patch asyncio to allow nested event loops"
arch=('x86_64')
url="https://github.com/erdewit/nest_asyncio"
license=('custom')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::git+https://github.com/erdewit/${_pkgname}#commit=${_pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}