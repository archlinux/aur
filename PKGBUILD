# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.13.0
pkgrel=1
pkgdesc="OneLogin's SAML Python Toolkit. Upstream python3-saml targeted at Python 3."
arch=('any')
url='https://github.com/onelogin/python3-saml'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92a1cf3b41667d7b385e579d07c0f051ff8ac9c71fcfecf2c60779216ad134f3')

build() {

    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build

}

package() {

    cd ${pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
