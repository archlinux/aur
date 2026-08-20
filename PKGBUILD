# Maintainer: Frezzydy <frezzydygaming@gmail.com>

name=wayra
pkgname=wayra-git
pkgver=0.1.1.r1.g360bd28
pkgrel=1
pkgdesc="A lightweight, high-performance standalone web server and directory explorer (latest)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/wayra"

license=('GPL-3.0')
depends=('zig')
conflicts=('wayra')

source=("${name}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${name}-main"

  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${name}-main"

  install -Dm755 "zig-out/bin/${name}" "${pkgdir}/usr/bin/${name}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
