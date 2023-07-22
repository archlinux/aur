# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.14.0
pkgrel=1
pkgdesc="SAML Python Toolkit (compatible with Python3)"
arch=('any')
url='https://github.com/saml-toolkits/python3-saml'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5c92def813070e360b2d32a51142d6e2333c84445ab3e4c126debb2762e6829')

build() {

    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build

}

package() {

    cd ${pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
