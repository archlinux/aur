# Maintainer: Your Name <youremail@domain.com>

pkgname=mkinitcpio-sd-zfs-rename
pkgver=0.1.0
pkgrel=2
pkgdesc='This module renames the zfs filesystem declared in (zpool get) bootfs, if the name ends with "_next_boot", by removing the "_next_boot" part from the filesystem name/path'
arch=('any')
url='https://aur.archlinux.org/packages/mkinitcpio-sd-zfs-rename'
license=('BSD0')
groups=()
depends=('systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=(
    'systemd-zfs-rename'
    'systemd-zfs-rename.service'
    'systemd-zfs-rename.sh'
)
noextract=()
sha256sums=(
    '57679b7b215fdae8295b1d34ad5fa21f5eb310d203bb3d62b8eed2cdb33e6171'
    'f2dc4b3252e2bb53d82c5cf24bf06b94e95ecc3732d9910bf285f0b468c70840'
    '374a3eab7284074276433418b87fdb0c166ce7e640c674a9ed215dc3406a7382'
)


package() {
    install -Dm644 "systemd-zfs-rename" "${pkgdir}/usr/lib/initcpio/install/systemd-zfs-rename"
    install -Dm644 "systemd-zfs-rename.service" "${pkgdir}/usr/lib/systemd/system/systemd-zfs-rename.service"
    install -Dm755 "systemd-zfs-rename.sh" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs-rename/systemd-zfs-rename.sh"
}

