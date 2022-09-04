# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=0.7.14
pkgrel=1
pkgdesc='Public Suffix List parser implementation'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('custom:MPL2')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('3b24ad28a7d96b966187b5cbb9f217b06d07ed294cfbfc2a9ca5afcced70cdd5')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
