# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=grub-hook-ca
pkgver=3
pkgrel=1
pkgdesc="Pacman hooks to install and generate grub using the method for CA signing of bootloader."
arch=('x86_64')
license=('GPL')
depends=("bash" "grub")
optdepends=("sbctl: To sign secureboot")
source=(grub-install
        grub-{install,vmlinuz}.hook)
sha256sums=('3c31996fc6e7671059a8e366f67396390b74e717c1dbf446e470f5e912a35f9a'
            '60eb5b7a3542167f4732a17614fb2145c2a662435627c3a33374ec307be7f0ce'
            '0fd2704ee9f7f335ad4960fc48d5225a8cbb0ab512a03160344200c37562e557')
install=${pkgname}.install

package() {
  # Install hook script
  install -Dm644 "${srcdir}/grub-install" "${pkgdir}/usr/share/libalpm/scripts/grub-install"
  chmod +x "${pkgdir}/usr/share/libalpm/scripts/grub-install"
  # Install hook file
  install -Dm644 "${srcdir}/grub-install.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-install.hook"
  install -Dm644 "${srcdir}/grub-vmlinuz.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-vmlinuz.hook"
}
