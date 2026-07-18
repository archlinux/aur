# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://github.com/fm-elpac/pmbs"
license=('MIT')
depends=('btrfs-progs>=7.1')
conflicts=('pmbs')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs-0.1.1.tar.gz::https://github.com/fm-elpac/pmbs/archive/refs/tags/v0.1.1.tar.gz'
        'pmbs-x86_64.zip::https://github.com/fm-elpac/pmbs/releases/download/v0.1.1/pmbs-x86_64.zip')
sha256sums=('fff051185fe7d014126e3e0aec7e58052b5db26f3205aed70adf2b095faa37c6'
            '3f8b9cca52ae367a0b29504883cef63d211339585b319da0dee2ba880c9d0cb9')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/pmbs-0.1.1"

  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/pmbs"

  make "FROM=." "TO=${pkgdir}" install-config
}
