# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=nvidia-hook
pkgver=2.3
pkgrel=1
pkgdesc='mkinitcpio hook to compile the NVIDIA modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('nvidia-dkms')
install='nvidia-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/nvidia')
sha256sums=('2f558d33e7a20db26a6ee60b6eade64b2a9a4b37af2b40c256d3e72270930478')

package() {
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  sed "s/_arch/$CARCH/" -i nvidia
  install -m 644 nvidia "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
