# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=10.0.0
pkgrel=2
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/home-assistant-libs/pytradfri"
license=('MIT')
depends=(
    'libcoap'
    'python-pydantic'
)
optdepends=(
	'python-aiocoap: for asynchronous applications'
	'python-dtlssocket: for asynchronous applications'
)
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha256sums=('2e68dedbbd13977b552e679fdbc69a957493d44a22fd2bd8eb7a6e89f82f941c')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
