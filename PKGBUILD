# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-xmldiff')
_pkgname='xmldiff'
pkgver='2.3'
pkgrel=1
pkgdesc="A libray and command line utility for diffing xml"
url="https://xmldiff.readthedocs.io"
checkdepends=()
depends=('python')
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2727f62ab590c1fc834e86033988a76a86a67f5a78196584049b7a722bd94466')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
