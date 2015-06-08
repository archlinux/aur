# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=nvidia-hook
pkgver=2.2
pkgrel=3
pkgdesc='mkinitcpio hook to compile the NVIDIA modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('nvidia-dkms')
install='nvidia-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/nvidia')
sha256sums=('d3cdc998faac6a8f835efb48b925758e5bb25cfa15e8f2f21430b46b9f880e26')

package() {
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  sed "s/_arch/$CARCH/" -i nvidia
  install -m 644 nvidia "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
