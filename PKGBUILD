# Maintainer: atomicfs

pkgname=mdbook-katex
pkgver=0.3.12
pkgrel=1
pkgdesc="A preprocessor for mdbook to render LaTeX equations in HTML"
url="https://github.com/lzanini/mdbook-katex"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ac31f600a54b00421e540a80dc6e5937b3b2da054cd452305ac1d61e7885cef4')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

