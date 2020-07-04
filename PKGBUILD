# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-core
pkgver=3.4.0
pkgrel=2
pkgdesc='Python Social Auth core component'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
depends=('python-six' 'python-defusedxml' 'python-pyjwt' 'python-jose' 'python-requests-oauthlib'
         'python-openid' 'python-cryptography' 'python3-saml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('06e137cf87a23bd077541523833b29f481081dd7ee143651b758db701032e606')

build() {

    cd social-core-${pkgver}
    python setup.py build

}

package() {

    cd social-core-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-core-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
