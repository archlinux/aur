# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-dbutils
pkgver=3.2.0
pkgrel=1
pkgdesc="Suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database"
url="https://github.com/WebwareForPython/DBUtils"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
arch=('any')
source=("https://github.com/WebwareForPython/DBUtils/archive/refs/tags/Release-${pkgver//./_}/DBUtils-$pkgver.tar.gz")
sha256sums=('af241163e33960701292fe78fe7eee7fab7b5dab6bd8a74fe686078c4d398d7e')

build() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
