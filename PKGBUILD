# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=python-publicsuffixlist
pkgver=1.0.2.20250603
pkgrel=1
pkgdesc='publicsuffixlist for python'
arch=('any')
url='https://github.com/ko-zu/psl'
license=('MPL-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/publicsuffixlist/publicsuffixlist-$pkgver.tar.gz")
sha256sums=('ca294e03cbca2dbed0d4a4c033bfa23b91c89298402e2f812fae11757229717e')

build() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/publicsuffixlist-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
