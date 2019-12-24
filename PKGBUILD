# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=nest_asyncio
pkgname=python-${_pkgname}
pkgver=1.2.1
_pkgver='dec94fc12450ca7b6d2e389dc4caf8d425dc4788'
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