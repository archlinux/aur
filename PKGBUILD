# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=3.2.1
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bc9246b653921c0bf9ced945408d89c370a8666271970198d3cbf51823fb82bcf9350b2c8a4acb69c073e5d68cac6c09a247f000f8a847cad2df519022e452e9')

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
