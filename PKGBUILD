# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=aiocoap
pkgname=python-${_pkgname}-git
pkgver=0.3.r320.g3286f48
pkgrel=1
pkgdesc="Python implementation of CoAP"
arch=('any')
url="https://github.com/chrysn/aiocoap"
license=('MIT')
provides=("python-${_pkgname}")
depends=('python>=3.4.4')
makedepends=('python-setuptools')
source=("git+https://github.com/chrysn/aiocoap.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir"
}
