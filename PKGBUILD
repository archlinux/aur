# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2023.12.29_12.09.27
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

sha256sums_x86_64=('051b3035e25e660a0dd7a13cf0a6552ee21b66cdc1b5415430ac371dfd979d63')
sha256sums_aarch64=('183db66d51ce80e0e0debaf38db465be5d71b6a4245ca1a9d2c693f4214cdbec')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
