# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=2.5.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('79331758fe305525fd7f97e3e1a9eecc22f79e96047080a31ad8df8d033b506d39c79fa5fe9e20cc2cb63db271517842ffcdab3f1fdb9785d135d3f65dffce6d')

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
