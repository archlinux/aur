# Maintainer: Grider <himekifee@gmail.com>

pkgname=hid-hp-zbook-dkms-git
_pkgbase=hid-hp-zbook
pkgver=0.1.1
pkgrel=1
pkgdesc="HP ZBook x2 G4 HID driver"
arch=('x86_64')
url="http://github.com/himekifee/hid-hp-zbook.git"
license=('GPL')
depends=('dkms')
makedepends=('git' 'linux-headers')
source=("git+https://github.com/himekifee/hid-hp-zbook.git")
sha512sums=('SKIP')


package() {
  cd ${srcdir}/hid-hp-zbook
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 *
  install -Dt "${pkgdir}/usr/lib/udev/rules.d" -m644 99-hp-zbook.rules

  # Set name and version
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}