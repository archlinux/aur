# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=14.3.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4e74a000c16a1de5b8d99ff344c1276bdc469d50b1a1779eabe063f7e443849d7049b3e2d8ca953116fb2ca781faf65c797b3e93dcd17ebc99bfd4db5c910b9f')
b2sums=('41f541dea40a81ffeb24ec176e48c17557c56b1f2e69712de9b9c339efd18f71931532513cded4ce920d5c9256fc5f63605ba940a0ca95678fad9c19955c6fd6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

