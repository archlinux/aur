# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-rstb
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="Utilities to modify Breath of the Wild's Resource Size Table (RSTB) "
arch=('any')
url="https://github.com/zeldamods/rstb"
license=('GPL2')
depends=('python' 'python-oead')
makedepends=('python-pip')
source=("https://github.com/zeldamods/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b0bb7990dde79189e9c6cafb6d9b94b4fd31dac862660ccde5ab78a8eba8ffc')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
