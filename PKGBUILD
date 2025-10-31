# Maintainer: Kagamma <kagamma(dot)km(at)gmail(dot)com>

pkgname=tparted-bin
pkgver=2025.10.31
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
            'cryptsetup: LUKS')
source=(https://github.com/Kagamma/tparted/releases/download/2025-10-31/linux_x86-64_tparted_2025-10-31.tar.gz)
sha256sums=(b81b9865489007f46701744dab0933f3bad88c16a7aa22416d11403d29849a7c)

pkgver() {
          printf "2025.10.31"
}

package() {
          tar xf ./linux_x86-64_tparted_2025-10-31.tar.gz
          # Install binaries & desktop file
          install -Dm755 tparted "${pkgdir}/usr/bin/tparted"
          mkdir -p ${pkgdir}/opt/tparted
          mv locale "${pkgdir}/opt/tparted/locale"
          # Cleanup
          rm -f tparted
          rm -f linux_x86-64_tparted_2025-10-31.tar.gz
}
