# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=0.7.13
pkgrel=1
pkgdesc='Public Suffix List parser implementation'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('custom:MPL2')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('07409a5821a1f662b694c7390bdd50539528eb9d1e626811ca5e1447366b185f')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
