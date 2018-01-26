# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=5.3.0
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/ggravlingen/pytradfri"
license=('MIT')
depends=('python' 'libcoap-dtls-git' 'python-aiocoap-git')
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha512sums=('56709ccb5150625213f6d13d36d5bfff97bce0ad1e8134e38bb81c5119d48b9ba3601f4ad2d2a11e810c49a2ac663e984aad2e2edd6d55ee2355d7a804282b98')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
