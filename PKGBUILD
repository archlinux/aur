# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=zfs-undelete
pkgver=0.1.0
pkgrel=1
pkgdesc='easy-to-use CLI tool to recover files from zfs snapshots'
url="https://github.com/arctic-penguin/$pkgname"
source=("https://github.com/arctic-penguin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
arch=('any')
license=('GPL3')
depends=('zfs-utils')
makedepends=('rust')
sha256sums=('013c8f4ba6c9a1213ab6e841553858f6c5f29332f5a87bc4748ea0abf7fec98a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/zfs-undelete "${pkgdir}/usr/bin/zfs-undelete"
}
