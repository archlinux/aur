# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.7'
_commit='c5d186d28f294fda60629b51fc5eaa5083916fb3'
pkgrel='1'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('597e6dbedfb3556fcf312d86eeb36f9335bd738335f42091de439bb0294e4755')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
