# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=12.5.1
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1121896643ecfce69762ef353bcadbac1c7e1d7bb72c69a617b92290d9641b6c4d7499e742f0d016e219e3e71696f46822caf08e3a7bd7b6616bb89159ee98e8')
b2sums=('351f03836f852e71fab57ee1b72d3b61931dacafa5001561ad07cf00c483c701b351f14005fe2b25a206e924479a164dae630d27286262b780360f3feff3076e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

