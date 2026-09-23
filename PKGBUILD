# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
_projectname='psl'
pkgname='python-publicsuffixlist'
pkgver='1.0.2.20260922'
pkgrel='1'
pkgdesc='publicsuffixlist for python'
arch=('any')
url="https://github.com/ko-zu/$_projectname"
license=('MPL-2.0')
depends=('python>=3.5.0' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-gha.tar.gz")
b2sums=('8df49aea84224c54319159e60ca66f5d3dd8f6b04c13d1e84b03515041c83292f1ed5f3283b78514a612b05e0a8a9e31e4f225973900359bfb87e2cddb699976')

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
