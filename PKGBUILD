# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.10.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8d3effe6d78c68398de9047bc438cf04f4ee565656c02468d92e0c492f3ccbe064e3da4d833f7852667fe96bd29743a26ed36d35cf2147b8bd4dea3dbeb6c15d')
b2sums=('8b182316e9d1ecbf06025d9fcfbc01bc18f66f0aaa2694c229ee42a85195351c16bf7e860b9af1ac3e1fbde0808492189bdd3320e8f58c35ce3b37f45ab77c44')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

