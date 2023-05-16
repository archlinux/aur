# Maintainer: Hoream <2175223953@qq.com>
pkgname=totalmapper
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple utility for remapping keys using the Linux event handling system."
arch=(x86_64)
url="https://github.com/ellbur/totalmapper"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("v${pkgver}.tar.gz::https://github.com/ellbur/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3e7aee60556a9697b228ee1a1dcfbbeb715ab0a098bbf18c8f5e08c206c7d3433c5d1b8bd9471591a0cd8cd167cde2ef275ee044328a6b54dd12b774cf9d3d1b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/totalmapper" "${pkgdir}/usr/bin/totalmapper"
  install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}/" "${srcdir}/${pkgname}-${pkgver}/README.md" 
}
