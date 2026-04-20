# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
pkgname=python-aesqlapius
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=1
pkgdesc="Manage SQL queries as a Python API"
arch=('any')
url="https://github.com/AMDmi3/aesqlapius"
license=('MIT')
depends=('python')
makedepends=('python-installer' 'python-build' 'python-wheel')
checkdepends=('pytest')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AMDmi3/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e7c18c10ba66105062283076d6f7aa8e54ae007f4e621367e1d6c45447df68f1')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
