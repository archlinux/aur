# Maintainer: Your Name <youremail@domain.com>

pkgname=mkinitcpio-sd-zfs-rename
pkgver=0.1.0
pkgrel=1
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
    'a9c5ff279ccd5b539bef099d4246c195977b79627f68494b296431e367bc07d1'
    '4a06f2d9587262f36221f4bb7fe07dfa4e54a73a395e1174da714a2d41a389b8'
    '374a3eab7284074276433418b87fdb0c166ce7e640c674a9ed215dc3406a7382'
)


package() {
    install -Dm644 "systemd-zfs-rename" "${pkgdir}/usr/lib/initcpio/install/systemd-zfs-rename"
    install -Dm644 "systemd-zfs-rename.service" "${pkgdir}/usr/lib/systemd/system/systemd-zfs-rename.service"
    install -Dm755 "systemd-zfs-rename.sh" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs-rename/systemd-zfs-rename.sh"
}

