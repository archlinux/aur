# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=5.0.0
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/ggravlingen/pytradfri"
license=('MIT')
depends=('python' 'libcoap-dtls-git' 'python-aiocoap-git')
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha512sums=('f898bf17dbcf687362ffab9e4daabd2a04dccf8291f8b2ea85b6b3487e3a9881cec9023aadfa8dcc6ceaae8dc2d3e3f412d983b715ef2ed24862eb7add57e3a1')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir"
}
