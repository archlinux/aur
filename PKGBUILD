# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
_projectname='psl'
pkgname='python-publicsuffixlist'
pkgver='1.0.2.20260328'
pkgrel='1'
pkgdesc='publicsuffixlist for python'
arch=('any')
url="https://github.com/ko-zu/$_projectname"
license=('MPL-2.0')
depends=('python>=3.5.0' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-gha.tar.gz")
b2sums=('454981d8acbd1fecfaae1e8beaba6c8cc514845d6368015e771dcc834497a93d0a2fcce85f877e8d2d6462471d1ebebd934945f4f89d7cf7be6f05d92abf169e')

_sourcedirectory="$_projectname-$pkgver-gha"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python -m publicsuffixlist.test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
