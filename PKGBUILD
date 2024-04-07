# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='dbus-client-gen'
pkgver=0.5.1
pkgrel=2
pkgdesc='A library for generating some simple classes and functions useful for a Python D-Bus client'
arch=('any')
license=('MPL2')
url='https://stratis-storage.github.io/'
depends=('python-dbus')
makedepends=('python-pylint' 'python-setuptools')
checkdepends=('python-nose' 'python-hypothesis' 'python-hs-dbus-signature')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2fd53bf85955cf9bc76f8bbbdb9968fc891401bea247b31d702a35f5a3bd8bba')

check() {
  cd "${pkgname}-${pkgver}"
  nosetests
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
