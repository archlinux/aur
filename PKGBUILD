# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2026.07.24
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

sha256sums_x86_64=('759f5483d224c42e2444fb88adb3718682182a266de0e180a79df451bb243e9c')
sha256sums_aarch64=('75358703531a09fec7ec7feeafddaa7df780ddba69e4a6451e513cd258c18328')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
