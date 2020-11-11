# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-archive-all
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
pkgver=1.22.0
pkgrel=1
url=https://github.com/Kentzo/git-archive-all
license=(custom:MIT)
depends=(git python-setuptools)
conflicts=(git-archive-all-git)
arch=(any)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('745e8d1dc0c6c7d20ec0ce89ad72bc78a8756c410339889f505f0b4e217da7d9cb5724f0bf539055a420e27a8fac2052d8aca620b902bf4f259ab5290bd780a7')

build () {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package () {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
