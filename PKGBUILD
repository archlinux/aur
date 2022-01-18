# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python2-saml
pkgver=2.6.0
pkgrel=1
pkgdesc="OneLogin's SAML Python Toolkit. Python 2 version / upstream python-saml."
arch=('any')
url='https://github.com/onelogin/python-saml'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-defusedxml' 'python2-isodate' 'python2-dm.xmlsec.binding')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5228ed6d15b65d3a9f4545c31ed12720d351b1405f454c1b7986e7692005d816')

build() {

    cd python-saml-${pkgver}
    python2 setup.py build

}

package() {

    cd python-saml-${pkgver}
    python2 setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/python-saml-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
