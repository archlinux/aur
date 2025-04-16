# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=1.0.2.20250319
pkgrel=1
pkgdesc='publicsuffixlist for python'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('MPL-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('3810648e70f33062a2c0b6f532791cc3fd08c1a789ca8492421dd856e175691a')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
