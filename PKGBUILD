# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='shd'
pkgver='0.0.12'
_commit='166aa7346317a80e7cca6a35abb77d692a0f80d9'
pkgrel='2'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('any')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('python' 'python-neotermcolor' 'python-pysmart' 'python-rapidtables')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('4321bb29f17c2d81a9f507da2575dac18ce5e8a02026e8c58c77e6c1e140e0e0')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
