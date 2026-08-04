# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2026.08.04
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

sha256sums_x86_64=('25dce55f597cc7f034f6c5f8bf4195128e3efeb3b22710a066fb67b489e70a3b')
sha256sums_aarch64=('9ef3add2c69a24cc5f40b07829f23407b36bba021c4345f4587fb6d51533ee25')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
