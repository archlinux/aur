# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.4.1
pkgrel=2
pkgdesc="OneLogin's SAML Python 3 Toolkit"
arch=('any')
url='https://github.com/onelogin/python3-saml'
license=('MIT')
makedepends=('python-setuptools')
makedepends=('python-defusedxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e41a9459e2f4fec1cbfb3ab95d9792a85d83ea6988551092bf03fad16be61c61')

build() {

    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build

}

package() {

    cd ${pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
