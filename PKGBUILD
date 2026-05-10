# Maintainer: Rusty Daemon (aur@rustydaemon.com)

pkgname=gitkraken-cli-bin
pkgver=3.1.62
pkgrel=1
pkgdesc="GitKraken CLI"
arch=('x86_64')
url="https://www.gitkraken.com/"
license=('LicenseRef-GitKraken-Proprietary')
options=(!debug)
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/gitkraken/gk-cli/releases/download/v${pkgver}/gk_${pkgver}_linux_amd64.zip"
  "LICENSE.txt"
  "README.md"
)
sha256sums=('0fdf77697c51adaf7b6a6af3a60f8e735d9015c704c0e339d2237bdca1040033'
            '4003c1c4250a61397257d7d2251613f8d9ba7c8029d9e90c69c79c226bf41a3b'
            'fb553e05cf57aadb4696f164f81e99576299f6706fa1dae093e47c76b9328cff')

package() {
  install -Dm755 "$srcdir"/gk "$pkgdir"/usr/bin/gk
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
