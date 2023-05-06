# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-dbutils
pkgver=3.0.3
pkgrel=1
pkgdesc="Suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database"
url="https://github.com/WebwareForPython/DBUtils"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
arch=('any')
source=("https://github.com/WebwareForPython/DBUtils/archive/refs/tags/Release-${pkgver//./_}/DBUtils-$pkgver.tar.gz")
sha256sums=('91e466834455e54d6e1071b2a7a40e862a2ffff36963f34f4f75171da0117872')

build() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
