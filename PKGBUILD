# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pygelf'
pkgname="python-$_projectname"
pkgver='0.4.2'
_commit='b84e0c9fa6dfd20dbb4cd0548e35ea9aab760af0'
pkgrel='1'
pkgdesc='Python logging handlers with GELF (Graylog Extended Log Format) support'
arch=('any')
url="https://github.com/keeprocking/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('b43269e9bced42c12306856e66843de3f46404aeb21eeb3b98d82b52aa18251e151cb69408d1be2c62d9713a63cfafce1b58ea8e10c4ceaff2e40ac98a15ab5f')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
