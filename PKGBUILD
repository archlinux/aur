# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-bin
pkgver=2026.03.26
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
            'nilfs-utils: for nilfs2 operations'
            'cryptsetup: LUKS')
source=(https://github.com/Kagamma/tparted/releases/download/2026-03-26_1/linux_x86-64_tparted_2026-03-26_1.tar.gz)
sha256sums=(c93eac8155af6f5bb027d6f699811d0a4765d153eb3e96ae2db2a33220a838aa)

pkgver() {
          printf "2026.03.26"
}

package() {
          tar xf ./linux_x86-64_tparted_2026-03-26_1.tar.gz
          # Install binaries & desktop file
          install -Dm755 tparted "${pkgdir}/usr/bin/tparted"
          mkdir -p ${pkgdir}/opt/tparted
          mv locale "${pkgdir}/opt/tparted/locale"
          # Cleanup
          rm -f tparted
          rm -f linux_x86-64_tparted_2026-03-26_1.tar.gz
}
