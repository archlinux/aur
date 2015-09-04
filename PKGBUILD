# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=vboxguest-hook
pkgver=1.1
pkgrel=1
pkgdesc='mkinitcpio hook to compile the virtualbox guest modules'
url='https://github.com/alucryd/mkinitcpio-hooks'
arch=('any')
license=('GPL3')
depends=('virtualbox-guest-dkms')
install='vboxguest-hook.install'
source=('https://raw.github.com/alucryd/mkinitcpio-hooks/master/vboxguest')
sha256sums=('ff6e2ddf037a198f5a8c8f1e8904a97a0c5939e3a02e02fef43ac0d32f6c4355')

package() {
  sed "s|_arch|$CARCH|" -i vboxguest
  install -dm 755 "${pkgdir}"/usr/lib/initcpio/install
  install -m 644 vboxguest "${pkgdir}"/usr/lib/initcpio/install/
}

# vim: ts=2 sw=2 et:
