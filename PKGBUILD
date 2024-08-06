# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2024.08.05_18.16.00
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

sha256sums_x86_64=('0deaec7beb06a9e3f05babd6256ba856aef8016946a623ece2bef251127bf19a')
sha256sums_aarch64=('248720c2c612f3c0303d38f23d0c5b00e7f98203b5ce9041b87683c1fdb73179')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
