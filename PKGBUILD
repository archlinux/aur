# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2025.08.15_17.11.38
pkgrel=1
epoch=2
pkgdesc="Language Server (LSP) for Clojure"
arch=('x86_64' 'aarch64')
url="https://github.com/clojure-lsp/clojure-lsp"
license=("MIT")
options=(!debug)
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-native-linux-aarch64.zip::${url}/releases/download/${pkgver//_/-}/clojure-lsp-native-linux-aarch64.zip")
source_x86_64=("${pkgname}-${pkgver}-native-static-linux-amd64.zip::${url}/releases/download/${pkgver//_/-}/clojure-lsp-native-static-linux-amd64.zip")

sha256sums_x86_64=('08e9a8144277fbb9897fda5827715f988d1847a1e9dd35443c50d112d6057f9c')
sha256sums_aarch64=('8414e63cd4991bf6cde414a3c093e4704b95243cd44be1497a8b17275c495d0b')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
