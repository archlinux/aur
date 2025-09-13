# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs-bin
pkgver=0.1.0a4
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://github.com/fm-elpac/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.16')
conflicts=('pmbs')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0-a4/download'
        'pmbs-x86_64.zip::https://github.com/fm-elpac/pmbs/releases/download/v0.1.0-a4/pmbs-x86_64.zip')
sha256sums=('1714bbe8ce2b1065c871a2c92b6853c61cbca75f01251b26c5492a84faa2e4cc'
            '8db98fa314ba03b457eac15d8852a25feb5253997be0ee6b5fcc01ecb16c6948')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/pmbs-0.1.0-a4"

  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/pmbs"

  make "FROM=." "TO=${pkgdir}" install-config
}
