# Maintainer: Juliette Monsel <j_4321@protonmail.com>
_pkgname="oauth"
pkgname="python-oauth"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Python 3 library implementing of the OAuth protocol."
arch=('any')
url="https://code.google.com/archive/p/oauth/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e769819ff0b0c043d020246ce1defcaadd65b9c21d244468a45a7f06cb88af5d')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    2to3 -w -n .
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
