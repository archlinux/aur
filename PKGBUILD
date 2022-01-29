# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.10.1
pkgrel=1
pkgdesc="OneLogin's SAML Python Toolkit. Upstream python3-saml targeted at Python 3."
arch=('any')
url='https://github.com/onelogin/python3-saml'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-defusedxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2485cf4494230e9e3fede28fe99b588bf12bc6b74bcebe3e171db5436e421fd3')

build() {

    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build

}

package() {

    cd ${pkgname}-${pkgver}
    python setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
