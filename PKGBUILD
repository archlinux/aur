# Maintainer: iamanuclearwarhead on github  <kiraralarpsec@gmail.com>
pkgname=system-backup
pkgver=1.0.0
pkgrel=1
pkgdesc="bare metal bootable LUKS/rsync system backup script for archlinux"
arch=('any')
url="https://github.com/iamanuclearwarhead/system-backup"
license=('GPL-3.0-or-later')
depends=('bash' 'rsync' 'cryptsetup' 'util-linux' 'e2fsprogs' 'dosfstools' 'arch-install-scripts')
optdepends=(
  'btrfs-progs: support for Btrfs target root filesystems'
  'xfsprogs: support for XFS target root filesystems'
  'f2fs-tools: support for F2FS target root filesystems'
  'grub: support for GRUB target bootloader'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iamanuclearwarhead/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c0a45d15a207619e99fe62a72e72fd9b43c58944055f99d18b99fb89f701a00')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 system-backup "${pkgdir}/usr/bin/system-backup"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
