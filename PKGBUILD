# Maintainer: Christopher A. Williamson <home@chrisaw.com>

pkgname='dbus-client-gen'
pkgver=0.3
pkgrel=1
pkgdesc='A library for generating some simple classes and functions useful for a Python D-Bus client'
arch=('any')
license=('MPL-2.0')
url='https://stratis-storage.github.io/'
depends=('python-dbus')
makedepends=('git' 'python-pylint' 'python-tox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('41fc256db0adedd7489c2744b0dd09fc53c5e4b680d31775fac96a4708d62338')

check() {
  cd "${pkgname}-${pkgver}"

  tox -e test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
