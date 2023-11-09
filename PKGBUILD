# Maintainer: atomicfs

pkgname=mdbook-katex
pkgver=0.5.8
pkgrel=1
pkgdesc="A preprocessor for mdbook to render LaTeX equations in HTML"
url="https://github.com/lzanini/mdbook-katex"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3fd969a2fb8fcd9e4b7158396d76fe5e7e8d7395c7d4aacd5e18ac4dc8d3a6f3')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

