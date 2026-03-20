# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzi
pkgver=1.1.2
pkgrel=1
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig")
url="https://github.com/TristanJet/muzi"
source=("https://github.com/TristanJet/muzi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("b2e0476e2eb36fbf9c08232275585c6668b7eeb6b16d8e47fcb290e4e9984658")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Drelease=true
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/muzi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
