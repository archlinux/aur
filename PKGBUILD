# Maintainer: apropos <jj@toki.la>
pkgname=python-httpx-ws
_pkgname=httpx_ws
pkgver=0.3.1
pkgrel=1
pkgdesc="WebSocket support for HTTPX"
arch=('any')
url="https://github.com/frankie567/httpx-ws"
license=('MIT')
depends=('python-httpx')
makedepends=('python-installer' 'python-hatch' 'python-hatchling' 'python-tomli-w')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6ec8341bc8fd4d1b983e9e041d986b4b1c2786658313317ef88808be61100b4e')

build() {
	cd "$_pkgname-$pkgver"
	hatch build
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
