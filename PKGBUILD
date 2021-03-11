
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-apng
_pkgname=pyAPNG
pkgver=0.3.4
pkgrel=1
pkgdesc='A Python module to deal with APNG files.'
arch=('any')
url="https://github.com/eight04/$_pkgname"
license=('MIT')
depends=('python')
optdepends=('python-pillow')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('8982a12d8e3d7244a59e3543db6152bea16c25d03fa66a32d1dacd32b193bf8d')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"
}
