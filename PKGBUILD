# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=grub-hook-ca
pkgver=2
pkgrel=1
pkgdesc="Pacman hooks to install and generate grub using the method for CA signing of bootloader."
arch=('any')
license=('GPL')
depends=("bash" "grub")
optdepends=("sbctl: To sign secureboot")
source=(grub
        grub-{grub_generate,vmlinuz_generate}.hook)
sha256sums=('98ae85bb0d38fb5823c9f041556f64f6181ebd1f73ed0216c942a192e65e593f'
            '6eb015989f4bbd928550b3bc2c8434d4a92409bcb0e9dc91b89c967d11cbba46'
            'de0da36d2f5b46f26b4181a24c74c57b880b5c102158d4855b07710e13f3c7f2')
install=${pkgname}.install

package() {
  # Install hook script
  install -Dm644 "${srcdir}/grub" "${pkgdir}/usr/share/libalpm/scripts/grub"
  chmod +x "${pkgdir}/usr/share/libalpm/scripts/grub"
  # Install hook file
  install -Dm644 "${srcdir}/grub-grub_generate.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-grub_generate.hook"
  install -Dm644 "${srcdir}/grub-vmlinuz_generate.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-vmlinuz_generate.hook"
}
