# Maintainer: Grider <himekifee@gmail.com>

pkgname=hid-alps-hp-dkms-git
_pkgbase=hid-alps-hp
pkgver=0.1.1
pkgrel=1
pkgdesc="ALPS HP specific HID driver"
arch=('x86_64')
url="http://github.com/himekifee/hid-alps-hp.git"
license=('GPL')
depends=('dkms')
makedepends=('git' 'linux-headers')
source=("git+https://github.com/himekifee/hid-alps-hp.git")
sha512sums=('SKIP')


package() {
  cd ${srcdir}/hid-alps-hp
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 Makefile hid-alps-hp.c dkms.conf

  # Set name and version
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}