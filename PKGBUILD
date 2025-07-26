# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2025.07.26
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

sha256sums_x86_64=('5827b360522202d23b8493d7d3eb1929780348083615680571dc839649bf2e3a')
sha256sums_aarch64=('46a94585c4d49909c42d2528d6bdf689978ce9c89e096b97fe7efec26c2a0535')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
