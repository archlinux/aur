# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=bbswitch-hook
pkgver=1.0
pkgrel=2
pkgdesc='mkinitcpio hook to compile the bbswitch module'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends='bbswitch-dkms'
install='bbswitch-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/bbswitch')
sha256sums=('9134827a9deab3ef787738976141b8ff573fd2b67681d61870c01f66c657bdae')

package() {
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  sed "s/_arch/$CARCH/" -i bbswitch
  install -m 644 {,"${pkgdir}"/usr/lib/initcpio/install/}bbswitch
}

# vim: ts=2 sw=2 et:
