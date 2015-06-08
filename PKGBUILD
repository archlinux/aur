# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vboxguest-hook
pkgver=1.0
pkgrel=2
pkgdesc='mkinitcpio hook to compile the virtualbox guest modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('virtualbox-guest-dkms')
install='vboxguest-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vboxguest')
sha256sums=('9b471fb0e6ad0d05a26dfd5cbc1706cb131edd45384c1e175e569711d0c5bb61')

package() {
  sed "s|_arch|$CARCH|" -i vboxguest
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vboxguest "${pkgdir}"/usr/lib/initcpio/install/vboxguest
}

# vim: ts=2 sw=2 et:
