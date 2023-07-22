# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.15.0
pkgrel=1
pkgdesc="SAML Python Toolkit (compatible with Python3)"
arch=('any')
url='https://github.com/saml-toolkits/python3-saml'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73cf5d4ba26bf9552ab7213068997304d843a040162100ff93dee4ef5e0ffe9b')

build() {

    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build

}

package() {

    cd ${pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
