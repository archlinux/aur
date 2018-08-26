# Maintainer: Drew DeVault <sir@cmpwn.com>
_name=patreon
pkgname="python-patreon"
pkgver=0.5.0
pkgrel=1
pkgdesc="Python wrapper for the Patreon API"
arch=("any")
url="http://github.com/Patreon/patreon-python"
license=("MIT")
depends=("python-requests")
makedepends=("python-distribute")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('04ad0360e7acc38a85beafa8d44eeeafd3c31d136488aa4de707526163682ca4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
