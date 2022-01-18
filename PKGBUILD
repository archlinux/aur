# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python2-saml
pkgver=2.7.0
pkgrel=1
pkgdesc="OneLogin's SAML Python Toolkit. Python 2 version / upstream python-saml."
arch=('any')
url='https://github.com/onelogin/python-saml'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-defusedxml' 'python2-isodate' 'python2-dm.xmlsec.binding')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('58d47df18a5f2539d6efd7662b1bc00f69d13b7d11a3536b0fa24679c510112c')

build() {

    cd python-saml-${pkgver}
    python2 setup.py build

}

package() {

    cd python-saml-${pkgver}
    python2 setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/python-saml-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
