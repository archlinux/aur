# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=0.10.0.20231214
pkgrel=1
pkgdesc='Public Suffix List parser implementation'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('custom:MPL2')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('76a2ed46814f091ea867fb40a6c20c142a437af7aae7ac8eb425ddc464bcb8e1')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
