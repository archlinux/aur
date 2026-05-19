# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=3.1.2
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d0dbc291361ff9c37b1adac6d3af5333958c945b04d10df9498baa1de8bc5c89b588d86c9006bad16b2b1c966423e397eeaf5ef7f711e4d7d6d2961d31812f15')

_archive="python-statemachine-$pkgver"

build() {
	cd "$_archive"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_archive"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
