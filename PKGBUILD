# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='rapidtables'
pkgname="python-$_projectname"
pkgver='0.1.11'
_commit='da2737da6c210518e3044782d72de031c53d9a7e'
pkgrel='3'
pkgdesc='Super fast list of dicts to pre-formatted tables conversion library'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('1151ea5fa3c0d8525b536f2466bb43e101049e8b32fa41e3040482473a831106')

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
