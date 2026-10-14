# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=3.2.2
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a309ac7c146402ae9acf5fe70341384f49144b6b02dcd782f24cbf48f6d998aa89fb2ef0bff2b4c54c98fba71a7d52de5a4c60490329e261e71441682a73c7fb')

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
