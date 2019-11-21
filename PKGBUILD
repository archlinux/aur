# Maintainer: Yuval Adam <aur at yuv dot al> PGP-Key: 55E36E28535222E2A2062848B75B5FC2FA1AFE15

pkgname=streamlib
pkgver=0.6.1
pkgrel=1
pkgdesc="Play your favorite live streams from command line"
arch=('any')
url="https://github.com/streamlib/streamlib"
license=(GPL)
makedepends=('cargo')
source=("https://github.com/streamlib/streamlib/archive/v${pkgver}.tar.gz")
sha1sums=('1373356032f9f1f7c4454daab7a815747e1dbe78')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/streamlib" "$pkgdir/usr/bin/streamlib"
}

# vim:set ts=2 sw=2 et:
