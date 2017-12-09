# Maintainer: Drew DeVault <sir@cmpwn.com>
_name=patreon
pkgname="python-patreon"
pkgver=0.4.0
pkgrel=1
pkgdesc="Python wrapper for the Patreon API"
arch=("any")
url="http://github.com/Patreon/patreon-python"
license=("MIT")
depends=("python-requests")
makedepends=("python-distribute")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aeaf57baebdf7eb7abc73f061192871245e74b295aa08ca491c01bca7f7aefa6')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
