# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
pkgname=ser4010_firmware
pkgver=0.2.0
pkgrel=1
pkgdesc="Firmware for UART controllable SI4010 based tunable OOK/FSK RF transmitter"
arch=('any')
url="https://github.com/dimhoff/ser4010"
depends=('si4010prog'
'c2_gpio-dkms')
source=('https://github.com/dimhoff/ser4010/releases/download/v0.2.0/ser4010_firmware-0.2.0.tar.gz'
'ser4010.service')
md5sums=('b009db33ae46efead5a273e1a46d10bb'
         'a1f69e8ea25172077c8af56114e2fcf4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "ser4010-${pkgver}.hex" "${pkgdir}/opt/${pkgname}/ser4010-${pkgver}.hex"

  cd "${srcdir}"
  install -Dm644 ser4010.service "${pkgdir}"/usr/lib/systemd/system/ser4010.service
}

# vim:set ts=2 sw=2 ft=sh et:
