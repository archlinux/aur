# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=10.12.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('872a3990f8dbaf933f4d9cb190d8fcb72062d81f3c431f58291216ab72dacb098057a75b7189e00a414ba62af6c9db658afc8e055833efa28aa03516060e6c35')
b2sums=('c3ac7abc345609071a4479ae02232ccff3bd3b8514d060cc41e75b4b549ed959412c2479e92219c7fb7694a38a00f0bea585549352a00025bd8845b9d432e500')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

