# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xmldiff'
_pkgname='xmldiff'
pkgver='2.4'
pkgrel=1
pkgdesc="A libray and command line utility for diffing xml"
url="https://xmldiff.readthedocs.io"
checkdepends=()
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('05bea20ce1f2c9678683bcce0c3ba9981f87d92b709d190e018bcbf047eccf63')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
