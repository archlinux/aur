# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2023.05.18
pkgrel=1
pkgdesc='A minimal and opinionated linter for Clojure code that sparks joy.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/clj-kondo'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.zip")
source_x86_64=("${pkgname}-${pkgver}-linux-static-amd64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-static-amd64.zip")

sha256sums_x86_64=('020688c82b44fe74d8eb67d7b9997dd6a27b4869cd44c9823d6845da3f641b36')
sha256sums_aarch64=('532e2eae743891cab1b9e02aba471b01605f9139759f4131d26abac8a6c06d44')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
