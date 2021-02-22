# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.9'
_commit='01cf24a234ae4abf12a41c1f2fb63117819d8bb7'
pkgrel='1'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('71b80b0929b32742fe4fb69e4340ff97044e91d13052cd64e82b4bf6d8955e91')

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
