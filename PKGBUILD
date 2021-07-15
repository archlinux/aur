# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=python-spake2
pkgver=0.8
pkgrel=7
pkgdesc="Pure-python implementation of the SPAKE2 Password-Authenticated Key"
arch=('any')
url="https://github.com/warner/python-spake2"
license=('MIT')
depends=('python' 'python-hkdf')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/warner/python-spake2/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('908c377c831f4a11551973ca917b113d51a66c533d35fd19b2692fdb7e575ed2a5045d9b632bc55c37b68ad092f01dff5da191e9dfbfb5599b72844788438d68')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
