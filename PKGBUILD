# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2025.03.07_17.42.36
pkgrel=1
epoch=2
pkgdesc="Language Server (LSP) for Clojure"
arch=('x86_64' 'aarch64')
url="https://github.com/clojure-lsp/clojure-lsp"
license=("MIT")
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-native-linux-aarch64.zip::${url}/releases/download/${pkgver//_/-}/clojure-lsp-native-linux-aarch64.zip")
source_x86_64=("${pkgname}-${pkgver}-native-static-linux-amd64.zip::${url}/releases/download/${pkgver//_/-}/clojure-lsp-native-static-linux-amd64.zip")

sha256sums_x86_64=('2cd065cc384119786f4c8b659e19c19278e09e28a4a0b5fe727936384716dd87')
sha256sums_aarch64=('8da532ffcb1514e7abda43e5c34e4bcf7da45637b1d3148899837247b070ecfc')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
