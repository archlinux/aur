# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='rapidtables'
pkgname="python-$_projectname"
pkgver='0.1.11'
_commit='da2737da6c210518e3044782d72de031c53d9a7e'
pkgrel='4'
pkgdesc='Super fast list of dicts to pre-formatted tables conversion library'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('d25c954fc4f90aa6d1faa75561465da0582ecbc59cbbc69cf603dc78d3a1aa007361c2680a545f0ab8204eafd97078e9fa059a702105c7fc957eb1ab3e04fd91')

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
