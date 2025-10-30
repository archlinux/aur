# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-bin
pkgver=2025.10.30
pkgrel=1
pkgdesc="Text-based user interface (TUI) frontend for parted, based on Free Vision application framework."
arch=(x86_64)
url="https://github.com/Kagamma/tparted"
license=('GPL-3.0')
depends=(parted util-linux)
optdepends=('dosfstools: for fat operations'
            'exfatprogs: for exfat operations'
            'e2fsprogs: for ext2/3/4 operations'
            'ntfs-3g: for ntfs operations'
            'btrfs-progs: for btrfs operations'
            'bcachefs-tools: for bcachefs operations'
            'xfsprogs: for xfs operations'
            'jfsutils: for jfs operations'
            'f2fs-tools: for f2fs operations'
            'cryptsetup: LUKS')
source=(https://github.com/Kagamma/tparted/releases/download/2025-10-30_1/linux_x86-64_tparted_2025-10-30_1.tar.gz)
sha256sums=(da6cfc7cfea52de6f7811d19e4fbdf6a8fa30bfdc8440d2b0bbb24db03b6686a)

pkgver() {
          printf "2025.10.30_1"
}

package() {
          tar xf ./linux_x86-64_tparted_2025-10-30_1.tar.gz
          # Install binaries & desktop file
          install -Dm755 tparted "${pkgdir}/usr/bin/tparted"
          mkdir -p ${pkgdir}/opt/tparted
          mv locale "${pkgdir}/opt/tparted/locale"
          # Cleanup
          rm -f tparted
          rm -f linux_x86-64_tparted_2025-10-30_1.tar.gz
}
