# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://github.com/fm-elpac/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.19')
conflicts=('pmbs')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0/download'
        'pmbs-x86_64.zip::https://github.com/fm-elpac/pmbs/releases/download/v0.1.0/pmbs-x86_64.zip')
sha256sums=('7b1ff7a2dbc387810a07160ed305f022265746a7439106f82f77ec34b098f46d'
            '6b45df48e14930dee3a271e73229fae8b37f532537f11b7515b0669e61045a58')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/pmbs-0.1.0"

  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/pmbs"

  make "FROM=." "TO=${pkgdir}" install-config
}
