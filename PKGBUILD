# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=bbswitch-hook
pkgver=1.1
pkgrel=1
pkgdesc='mkinitcpio hook to compile the bbswitch module'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends='bbswitch-dkms'
install='bbswitch-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/bbswitch')
sha256sums=('ee5303e221ffb03058897e7e21add18b38e5983e8a32c4419eaf089b3955c14a')

package() {
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  sed "s/_arch/$CARCH/" -i bbswitch
  install -m 644 bbswitch "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
