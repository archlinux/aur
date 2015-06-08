# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vboxhost-hook
pkgver=1.0
pkgrel=3
pkgdesc='mkinitcpio hook to compile the virtualbox host modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('virtualbox-host-dkms')
install="${pkgname}.install"
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vboxhost')
sha256sums=('6c5e321b6dac90ca6b7c7e45c842081762d140679bf186dcb948d65eb702bd15')

package() {
  sed "s|_arch|$CARCH|" -i vboxhost
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vboxhost "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
