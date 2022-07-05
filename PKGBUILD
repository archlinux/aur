# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-keycloak
pkgver=1.8.0
pkgrel=1
pkgdesc='Python package providing access to the Keycloak API'
arch=('any')
url='https://github.com/marcospereirampj/python-keycloak'
license=('MIT')
depends=('python' 'python-requests' 'python-jose')
makedepends=('python' 'python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/marcospereirampj/python-keycloak/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9a239c774b6a0ad1e9223acd1653eb27ff557404348077d28d07cf2583663e35')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  python3 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-$pkgver"

  # requires: python-httmock
#python3 setup.py test
}
