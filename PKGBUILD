# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-bin
pkgver=2025.11.02
pkgrel=0
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
source=(https://github.com/Kagamma/tparted/releases/download/2025-11-02/linux_x86-64_tparted_2025-11-02.tar.gz)
sha256sums=(75554dafc54bf123f6802772b1b136f1080a5863b37c6a08755233251c51a7d3)

pkgver() {
          printf "2025.11.02"
}

package() {
          tar xf ./linux_x86-64_tparted_2025-11-02.tar.gz
          # Install binaries & desktop file
          install -Dm755 tparted "${pkgdir}/usr/bin/tparted"
          mkdir -p ${pkgdir}/opt/tparted
          mv locale "${pkgdir}/opt/tparted/locale"
          # Cleanup
          rm -f tparted
          rm -f linux_x86-64_tparted_2025-11-02.tar.gz
}
