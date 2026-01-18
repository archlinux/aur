# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzi
pkgver=1.0.0
pkgrel=2
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig")
url="https://github.com/TristanJet/muzi"
source=("https://github.com/TristanJet/muzi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e6c6509aed9513c5574437da40912a8efab6248910bd9f6b90a03ec39476f950")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/muzi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
