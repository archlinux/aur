# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=grub-hook-ca
pkgver=1
pkgrel=1
pkgdesc="Pacman hooks to install and generate grub using the method for CA signing of bootloader and remove grub completely from system upon its uninstallation."
arch=('any')
license=('GPL')
depends=("bash")
optdepends=("grub: The Bootloader"
            "sbctl: To sign secureboot")
source=(grub
        grub-{grub_generate,vmlinuz_generate,remove}.hook)
sha256sums=('180a4711e9dc9dc47fb972091d87246c846b7aa5c431e1c5c973fcbd806ce4bd'
            '6eb015989f4bbd928550b3bc2c8434d4a92409bcb0e9dc91b89c967d11cbba46'
            'de0da36d2f5b46f26b4181a24c74c57b880b5c102158d4855b07710e13f3c7f2'
            '88c26842f4a361a494ebe426d3a624b7d256d648acde1a9854f56f38b16277ec')
install=${pkgname}.install

package() {
  # Install hook script
  install -Dm644 "${srcdir}/grub" "${pkgdir}/usr/share/libalpm/scripts/grub"
  chmod +x "${pkgdir}/usr/share/libalpm/scripts/grub"
  # Install hook file
  install -Dm644 "${srcdir}/grub-grub_generate.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-grub_generate.hook"
  install -Dm644 "${srcdir}/grub-vmlinuz_generate.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-vmlinuz_generate.hook"
  install -Dm644 "${srcdir}/grub-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-remove.hook"
}
