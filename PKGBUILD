# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=1.0.2.20250710
pkgrel=1
pkgdesc='publicsuffixlist for python'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('MPL-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('dcf92f627ca6ed619c221e09f3114251b641e42d5f9a290ad0975d9df62acd55')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
