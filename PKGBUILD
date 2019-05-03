# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-pickle5')
_pkgname='pickle5'
pkgver='0.0.7'
pkgrel=1
pkgdesc="Experimental backport of the pickle 5 protocol (PEP 574)"
url="https://github.com/pitrou/pickle5-backport"
depends=('python')
checkdepends=()
makedepends=('python-setuptools')
license=('custom')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4aab3fefd665257c16b95ff158c38bedf26595aebcbf11d264e653866579b175')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
