# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-archive-all
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
pkgver=1.23.0
pkgrel=1
url=https://github.com/Kentzo/git-archive-all
license=(custom:MIT)
depends=(git python-setuptools)
conflicts=(git-archive-all-git)
arch=(any)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6d5b97088b8a153d25c05d926b81a95382bfc730263b152a07292cc35756f80d1d25342db946a83b96c3e064bc001195bda89c2ca697acd338c30fd3320e6c44')

build () {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package () {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
