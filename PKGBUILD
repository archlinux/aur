# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=13.0.1
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('689b3e5512ef7f1f79afed0c20dcbe8009f00483e99118c556cb83596651b767ee2e495af0e3cb900441b5ccfe5dc4f671dfd5506210c99306c1ec95ca274e59')
b2sums=('dbe60f4e892978e83bda6f81c99039733c4c42677d82a0845994b96ed31a76957a26e77f4d037db5db624363e5aa1728af1e0fba77037fbfdb761f92f3f63d92')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

