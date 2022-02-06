# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=9.0.0
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/home-assistant-libs/pytradfri"
license=('MIT')
depends=('libcoap')
optdepends=(
	'python-aiocoap: for asynchronous applications'
	'python-dtlssocket: for asynchronous applications'
)
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha256sums=('f659e0cd4be958a017b91ec27b0b6ddcd8bf2fdd92c34432b9b5826ad787d237')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
