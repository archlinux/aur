# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=14.4.1
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9abe91812ed024339c5b665c911bd6fded3b76daf46448673a79794628ac0dc574780ecdd15677a4a27eabbca66ff7d066bb09d4e61911af9ed9bfa21a3170e2')
b2sums=('10cdda24321ad02423f256bab6ce72f609ff0ffadd740d836293c2a5c077181786ed0cf19994fc19951e76728dee6acfe8bbed1aceb63fa397c72d1477e268cd')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

