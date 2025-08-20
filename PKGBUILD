# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=12.4.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('89538ba8db7c317dc40f2eb42cacd938cb316bf10f69cad4d841314a942b0d1eeba1305e18bf0941e5056bda2a5d49a94068c090703a4a2dab1a7ed6e9be0e18')
b2sums=('d6531833312d3da5b962905ca718b2f90460b6995311f58c652e74bd589753ef76d47776724adfe163e149b24b40fcb54580bc36a5d2c5b698932937e655d98a')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

