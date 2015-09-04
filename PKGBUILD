# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vboxhost-hook
pkgver=1.1
pkgrel=1
pkgdesc='mkinitcpio hook to compile the virtualbox host modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('virtualbox-host-dkms')
install='vboxhost-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vboxhost')
sha256sums=('e0ce8da015927011ea050f935c77b3d44a0406e6bc34a147f0d6ac7be1da5901')

package() {
  sed "s|_arch|$CARCH|" -i vboxhost
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vboxhost "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
