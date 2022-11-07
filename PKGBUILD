# Maintainer: rockmonstr

pkgname=dracut-btrfs-uefi-hook
pkgver=4
pkgrel=1
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation with disk name and subvolume ID"
arch=(any)
license=('MIT')
depends=(dracut systemd binutils util-linux)
source=('90-dracut-btrfs-uefi-install.hook'
        '60-dracut-btrfs-uefi-remove.hook'
        'dracut-btrfs-uefi-install'
        'dracut-btrfs-uefi-remove')
sha256sums=('dd0bd5d30882a69997af0fc4802a336a9fc822c8aa69d09b13fa1f4c6e330d59'
            '80339794af6734c5bae1d3940527b5cc59ca1442a7eb9752739bec62f41e7050'
            '533597501e7b23dc661c8b8d255a43c2f583d6cdc830a4912afb2252249a3f2d'
            '6d6662a2e3a15a208fa88e83affa5297b1a92d595da10b9b2a8e021885874f2c')
            
url="https://aur.archlinux.org/packages/dracut-btrfs-uefi-hook/"
conflicts=(dracut-hook-uefi dracut-uefi-hook)

package() {
  install -Dm644 "${srcdir}/90-dracut-btrfs-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-btrfs-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-btrfs-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-btrfs-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-btrfs-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-btrfs-uefi-install"
  install -Dm755 "${srcdir}/dracut-btrfs-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-btrfs-uefi-remove"
}

