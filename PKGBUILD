# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzi
pkgver=1.0.1
pkgrel=2
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig")
url="https://github.com/TristanJet/muzi"
source=("https://github.com/TristanJet/muzi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("767ec1b0e593218da4e79f8f036086398413e6f2cf0ddc2e378632237744e9a7")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/muzi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
