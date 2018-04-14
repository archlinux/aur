# Maintainer: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-dbus-client-gen'
pkgver=0.6
pkgrel=1
pkgdesc='A Python Library for Generating dbus-python Client Code'
arch=('any')
license=('MPL-2.0')
url='stratis-storage.github.io'
depends=('python-dbus')
makedepends=('git' 'python-pylint' 'python-tox' 'yapf')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '37afb7a79201d985f0e48114cdb7b3539dc8cdcffec826ab14799d8d83c1c031'
)

check() {
  cd "${pkgname}-${pkgver}"

  tox
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
