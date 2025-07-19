# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=12.3.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b6e785f13ba8d901361f3e66f66905be06c24e439f51129b566134775503e45b9dcbb9f0929a319bbc57e0626fe049d25f73219cb8f87f96bec27e33b09c5feb')
b2sums=('3330dd7d299f6857897f1124e05db91e443fe196ad41867a359a6e9127c230aad93e7483edc5921e80ae9a216cbc33f3da0b87e4a11505bdec4e2706cadcc384')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

