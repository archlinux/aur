# Maintainer: Fantix King <fantix.king@gmail.com>
_pkgname=aiosmtplib
pkgname=python-$_pkgname
pkgver=2.0.2
pkgrel=1
pkgdesc="asyncio smtplib implementation"
arch=('any')
url="https://github.com/cole/aiosmtplib"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e37f7ec67d8c4def3e79cfbed78d27ca91c67def7062b6781c2827d8f63d775')

build() {
	cd $_pkgname-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $_pkgname-$pkgver
}

package() {
	cd $_pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
