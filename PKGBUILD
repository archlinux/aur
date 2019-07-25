# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=git-archive-all
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
pkgver=1.19.4
pkgrel=1
url='https://github.com/Kentzo/git-archive-all'
license=(custom:MIT)
depends=(git python-setuptools)
conflicts=(git-archive-all-git)
arch=(any)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1a68371a9cdd09b25823760a484d37b4d7c0d820c4258c798834ffa90aad184d12ccc055010a7e76b7dbce14d29f45b96f1c383e898ede8635a62bd47effcd25')

build () {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package () {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
