# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vhba-hook
pkgver=1.0
pkgrel=2
pkgdesc='mkinitcpio hook to compile the vhba module'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('vhba-dkms')
install='vhba-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vhba')
sha256sums=('2e264e0d6e3b54b0a6a91e4880116a96ced4246420db793df2da86cfd02e54fa')

package() {
  sed "s|_arch|$CARCH|" -i vhba
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vhba "${pkgdir}"/usr/lib/initcpio/install/vhba
}

# vim: ts=2 sw=2 et:
