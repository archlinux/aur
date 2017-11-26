# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=5.1.0
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/ggravlingen/pytradfri"
license=('MIT')
depends=('python' 'libcoap-dtls-git' 'python-aiocoap-git')
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha512sums=('465cca20a1d6dd6f5c9fad345109495a535f46e446f62809e756f45d422bf153105b227cbe263a2ec882db2ae314c9cd4f6b317efa7ddedee1f615220a93e0fa')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir"
}
