# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.8'
_commit='0893ac7e18cccbcecf12b80c262ba674d969bd6a'
pkgrel='2'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e3ce226462a448b8e66744ea513e24545a13900e7567cc2d97f2690769b67cbc')

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
