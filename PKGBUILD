# Maintainer: Frezzydy <frezzydygaming@gmail.com>

pkgname=wayra
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight, high-performance standalone web server and directory explorer."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/wayra"

license=('GPL-3.0')
depends=('zig')
conflicts=('wayra-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "zig-out/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
