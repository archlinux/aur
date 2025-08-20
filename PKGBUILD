# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.13.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f6c8e58b9411c9b37a065704c4f52cd41ee3d0d3ac6f965be94b4fb82a7e06e4fbf76cac1864060c3c0b05c9a9075e931fcd9f5f75cd6ec6a176f0423989cc54')
b2sums=('b66c3ddccb369af1d9ba90449d74ec9ff16b5f4da8766af7ba1c6c13d4be0b9be0e942a072b9fd2bf782fc67b009c6993aa8a407619339f8de8665eb8fe697f6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

