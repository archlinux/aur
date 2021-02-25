# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@garudalinux.in>

pkgname=croco-hooks
pkgdesc="additions and enhancements to croco."
pkgver=0.0.1
pkgrel=30
arch=('any')
license=('GPL')
depends=('pacman' 'pacman-contrib' 'chaotic-mirrorlist' 'nss-mdns' 'rebuild-detector')
install=croco-hooks.sh
source=(just-reboot.hook
mkinitcpio-grub-update.hook
lsb-release.hook
os-release.hook
orphans.hook
pacnew-check.hook
foreign.hook
issue.hook
nsswitch.hook
grub-fix-initrd-generation.hook
grub-fix-initrd-generation
)
md5sums=('d1c93d328cd5f3a0791390a66d62ca55'
         'd48b7bf271c8cb8a37f4c13777aae09e'
         'd94e41ee0b47a1a864abe23468773b6d'
         '857cd16880445e022a911463e1b4b76d'
         'f7aef70544b2f4ce5423de2c77a57232'
         'e5274c70d324eb139960f3a6e8e99a19'
         'e0f95c27949d32c8e05bc2d5b07605a6'
         'b554d500e01b768fe2f07f97ea91930b'
         '3d67e3587221018eacc5d04a0eb464eb'
         'cc5954d4d78e8289bc1990b0aaaf3157'
         '865891564d21ac40db26f22a56bf68df')

package() {
  cd $srcdir

  install -d $pkgdir/etc/pacman.d/hooks
  install -Dm644 just-reboot.hook $pkgdir/etc/pacman.d/hooks/just-reboot.hook
  install -Dm644 mkinitcpio-grub-update.hook $pkgdir/etc/pacman.d/hooks/mkinitcpio-grub-update.hook
  install -Dm644 lsb-release.hook $pkgdir/etc/pacman.d/hooks/lsb-release.hook
  install -Dm644 os-release.hook $pkgdir/etc/pacman.d/hooks/os-release.hook
  install -Dm644 orphans.hook $pkgdir/etc/pacman.d/hooks/orphans.hook
  install -Dm644 pacnew-check.hook $pkgdir/etc/pacman.d/hooks/pacnew-check.hook
  install -Dm644 foreign.hook $pkgdir/etc/pacman.d/hooks/foreign.hook
  install -Dm644 issue.hook $pkgdir/etc/pacman.d/hooks/issue.hook
  install -Dm644 nsswitch.hook $pkgdir/etc/pacman.d/hooks/nsswitch.hook
  install -Dm644 grub-fix-initrd-generation.hook $pkgdir/etc/pacman.d/hooks/grub-fix-initrd-generation.hook
  
  install -d $pkgdir/usr/bin
  install -Dm755 grub-fix-initrd-generation    $pkgdir/usr/bin/grub-fix-initrd-generation
}
