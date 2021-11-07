# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=7.1.1
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/home-assistant-libs/pytradfri"
license=('MIT')
depends=('libcoap-dtls-git')
optdepends=(
	'python-aiocoap: for asynchronous applications'
	'python-dtlssocket: for asynchronous applications'
)
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha256sums=('b7187fc39dcda622ed9dccbc009e92d9fe7e2f446df4204687d14e3bf39b1233')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
