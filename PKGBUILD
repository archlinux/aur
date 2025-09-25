# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.14.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fe88f46a90458710c405b0520616c2d902022e6938bdf1f75bc90afd49c142d5c0eb1d867dbbe296f18e8c4d0274ed623ebb06240503d1705c3f6f23e113fdca')
b2sums=('a455cd2a8271e5886817bd473535e501e5071aa6243fd1a5ed036d9a8ec69d2910d18d2f8982fa73a5be03fa9d2fb2925a0ae04311e4196b70cc23f306a8d9e9')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

