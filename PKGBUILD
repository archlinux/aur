# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2024.03.01_11.37.51
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

sha256sums_x86_64=('adde8325b65df10acc5d598f2aee1e9349c05f7bae2450c5d8c615b1f7fcc3e9')
sha256sums_aarch64=('835e36346f00057fac525ef3e75fda81ab45163292705066e32bdb03fbeeaf18')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
