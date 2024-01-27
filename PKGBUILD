# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.10'
_commit='f4993d2590a2bfe6d89d075a38ede39e7dd0b896'
pkgrel='2'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('cbfcb22170dcb8052e62078787e5c156ecdc27a1a0ad531f5c4ec8d3250ff88595a77dd47a80b02a7e5263303985135734f505fc0ee714210a61b43a85df3250')

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
