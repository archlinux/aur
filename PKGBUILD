# Maintainer: atomicfs

pkgname=mdbook-footnote
pkgver=0.1.1
pkgrel=1
pkgdesc="A preprocessor for mdbook to support the inclusion of footnotes"
url="https://github.com/daviddrysdale/mdbook-footnote"
arch=(x86_64)
license=(Apache)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c5a76a6dbb4a27bff9dfae4398c32497206c3667d70aa7ec8f32a7d98ab11a83')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

