# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.21.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1d91e8b0879146dfffbc4ec9f2663270bd828e28700e68d29037c3617eacc4b221173d14f4f268653248660d76ea17033da542ab33c67faf8051e591eba35c6f')
b2sums=('db0c4e89c26eab73dbc69617d3492d7e33de1d6a53e8a3fbb70f3ad398079a31ae880c717d8c9fbaf281940ca4c1365007567ac091bf32a56ef254642fc04e23')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

