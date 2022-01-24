# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-dbutils
pkgver=3.0.2
pkgrel=1
pkgdesc="Suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database"
url="https://github.com/WebwareForPython/DBUtils"
license=('MIT')
depends=('python')
arch=('any')
source=("https://github.com/WebwareForPython/DBUtils/archive/refs/tags/Release-${pkgver//./_}/DBUtils-$pkgver.tar.gz")
sha256sums=('10226df9f0cf71a62c001fda61b46097f16389d94eaaa21d1e3ddf4032daf509')

build() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python setup.py build
}

package() {
	cd "$srcdir/DBUtils-Release-${pkgver//./_}"
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
