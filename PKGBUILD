# Maintainer: Jax Young <jaxvanyang@gmail.com>
_name=pysgf
pkgname="python-$_name"
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple SGF parser"
arch=('any')
url="https://pypi.org/project/pysgf"
license=('MIT')
depends=('python>=3.6')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ff6a95e3891818a12e09af022aebec0bfaeca8617599f34e647a94ae02ee0303')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
