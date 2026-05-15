# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=3.1.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('42a82305ed19275c155793a49dbaf9c3ada32f01880a88cc926286db2e529cfc17ff08c62c1f879b5d9e8d72d03e7f655881f5d6fa749e06af24c954f0b6cf97')

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
