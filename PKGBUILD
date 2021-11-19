# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-botw-utils
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Library containing various utilities for modding The Legend of Zelda: Breath of the Wild"
arch=('any')
url="https://github.com/NiceneNerd/botw-utils"
license=('Unlicense')
depends=('python' 'python-xxhash' 'python-oead')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('c393aadbe2a7607083f85e4db697ad652da9c91265432c31f3ba9bf8ea5b5f20')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
