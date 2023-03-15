# Maintainer: Hoream <2175223953@qq.com>
pkgname=totalmapper
pkgver=1.3.14
pkgrel=1
pkgdesc="A simple utility for remapping keys using the Linux event handling system."
arch=(x86_64)
url="https://github.com/ellbur/totalmapper"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("v${pkgver}.tar.gz::https://github.com/ellbur/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('03cf70ce8bbc3ee742c583681389dff96654c5ab5a1f3270452d2c09a61f191e9893494d19db95edb178590291fd64f217fa4c542952ab49e8264cadb877ff53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/totalmapper" "${pkgdir}/usr/bin/totalmapper"
  install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}/" "${srcdir}/${pkgname}-${pkgver}/README.md" 
}
