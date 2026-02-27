# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzi
pkgver=1.1.1
pkgrel=1
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig")
url="https://github.com/TristanJet/muzi"
source=("https://github.com/TristanJet/muzi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("27020d69938c3615144a5d0a90d2a887c2750c0f164ac91c656deaf55fb97883")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Drelease=true
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/muzi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
