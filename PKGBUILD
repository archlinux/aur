# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-bin
pkgver=2024.12.31
pkgrel=5
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
            'xfsprogs: for xfs operations'
            'jfsutils: for jfs operations'
            'f2fs-tools: for f2fs operations')
source=(https://github.com/Kagamma/tparted/releases/download/2024-12-31_5/linux_x86-64_tparted_2024-12-31_5.tar.gz)
md5sums=(be881c3fa2564024c53d552f40ed58e5)

pkgver() {
          printf "2024.12.31"
}

package() {
          tar xf ./linux_x86-64_tparted_2024-12-31_5.tar.gz
          # Install binaries & desktop file
          install -Dm755 tparted "${pkgdir}/usr/bin/tparted"
          mkdir -p ${pkgdir}/opt/tparted
          mv locale "${pkgdir}/opt/tparted/locale"
          # Cleanup
          rm -f tparted 
          rm -f linux_x86-64_tparted_2024-12-31_5.tar.gz
}
