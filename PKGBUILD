# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vhba-hook
pkgver=1.1
pkgrel=1
pkgdesc='mkinitcpio hook to compile the vhba module'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('vhba-dkms')
install='vhba-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vhba')
sha256sums=('443546ae1d98dbc506f2e8578547c60537cc0643f76ae41206290ce81bec596d')

package() {
  sed "s|_arch|$CARCH|" -i vhba
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vhba "${pkgdir}"/usr/lib/initcpio/install/vhba
}

# vim: ts=2 sw=2 et:
