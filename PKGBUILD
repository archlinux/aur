# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=12.2.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bcc779e26cfc02bfb4364f017158fee50c80f628c412897b3e0e4d240ee1a801cebd5fc3b3430a95e57779437b518772b96b297b7db3291dee67a5779a08902b')
b2sums=('eb9f10395f333042bd94d4c9bba98e45b27083c0cb870d4b166b41f70b636d43842cd54507b2b81ac0c36a72d5dbd5c5c94b2c22f3dff46d03f41356ad3fa72d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

