# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2026.10.20
pkgrel=1
pkgdesc='A minimal and opinionated linter for Clojure code that sparks joy.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/clj-kondo'
license=('EPL')
options=(!debug)
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.zip")
source_x86_64=("${pkgname}-${pkgver}-linux-static-amd64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-static-amd64.zip")

sha256sums_x86_64=('316013be2f62e3649ee479e44ea82afb3b7eb64de76e0bbe0c1a2133ef2a7466')
sha256sums_aarch64=('8231f5a039dfa4d6c255a25ad3c1286a6a1679cd706ddbee646a6cbed4ba684c')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
