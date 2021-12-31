# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=8.0.0
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
sha256sums=('b359cac3416263c6f1c7b2540ba9d45be145bac875fb6e7c828051224bd77df6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
