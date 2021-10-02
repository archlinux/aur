# Maintainer: robertfoster
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-core
pkgver=4.1.0
pkgrel=1
pkgdesc='Python Social Auth core component'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
depends=('python-six' 'python-defusedxml' 'python-pyjwt' 'python-jose' 'python-requests-oauthlib'
  'python-openid' 'python-cryptography' 'python3-saml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3398690b33e42f6be8637742f5b737d86aa406e8c966ef717a2dafa4afdce213')

build() {
  cd social-core-"${pkgver}"
  python setup.py build
}

package() {
  cd social-core-"${pkgver}"
  python setup.py install \
    --root "${pkgdir}" \
    --optimize=1

  install -Dm644 "${srcdir}/social-core-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
