# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=0.10.0.20240525
pkgrel=1
pkgdesc='Public Suffix List parser implementation'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('MPL-2.0')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('b87fa8f8cfda14b11a18e81dbac49724decfb477700fabf7b65864c11c9b4e36')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
