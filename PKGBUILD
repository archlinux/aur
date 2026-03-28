# Maintainer: Rusty Daemon (aur@rustydaemon.com)

pkgname=gitkraken-cli-bin
pkgver=3.1.54
pkgrel=1
pkgdesc="GitKraken CLI"
arch=('x86_64')
url="https://www.gitkraken.com/"
license=('LicenseRef-GitKraken-Proprietary')
options=(!debug)
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/gitkraken/gk-cli/releases/download/v${pkgver}/gk_${pkgver}_linux_amd64.zip"
  "LICENSE.txt"
)
sha256sums=(
  'a6b8c3485b22175b3c7637f4707a9c22aa0beb57ccce4e776477ac23f28cb55b'
  '4003c1c4250a61397257d7d2251613f8d9ba7c8029d9e90c69c79c226bf41a3b'
)

package() {
  install -Dm755 "$srcdir"/gk "$pkgdir"/usr/bin/gk
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
