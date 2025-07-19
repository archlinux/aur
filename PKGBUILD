# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.11.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f9958dd2d6967f86a61172106c35405cbd39f5992bf22bc3e7a909b99ff0dc7fe566922362db60a239fce39d193955a4d08472a73ca393358e2b80a48b369bef')
b2sums=('b9e5b8b76fb8d676e8e801db2ec21a3b7e159101325d94494bf5e5596d6b910b1a99771d2434374e59fa5c441ca12e19e81cd2bee7ec6277b98d35c01d46e8c6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

