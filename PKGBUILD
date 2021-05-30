# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=0.7.8
pkgrel=1
pkgdesc='Public Suffix List parser implementation'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('custom:MPL2')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('ffda7c88f82c8f0d8695d1087f8212f91eaed713e93e6c5d8042a8ca42842685')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
