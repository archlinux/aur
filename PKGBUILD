# Maintainer: Stunts <f.pinamartins[at]gmail.com>
# Maintainer: Phil Schaf <flying-sheep[at]web.de>
_name=async-timeout
pkgname=python-async-timeout
pkgver=1.2.0
pkgrel=1
pkgdesc='asyncio-compatible timeout class'
arch=('any')
url="https://github.com/aio-libs/${_name}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/aio-libs/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('dd6975e985fdfcdf2bd4e3455308de4dad15f89fae3ce3b94ddf0cac1c627dd4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
}
