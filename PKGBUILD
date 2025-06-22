# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=1.0.2.20250617
pkgrel=1
pkgdesc='publicsuffixlist for python'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('MPL-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('5042d7fc63f572f92632936efb3ce6432c1a2a464f24fd43f25af742618790e6')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
