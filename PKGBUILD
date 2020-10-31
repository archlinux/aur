# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.6.0+7c8d9cfa4

pkgname=zig-dev-bin
pkgver=20201031
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig')
conflicts=('zig')
source=(
  "https://ziglang.org/builds/zig-linux-x86_64-${_buildver}.tar.xz"
)
sha256sums=(
  '4eb550495d1d7b521047a0e68f5c21ed1c1c4e1caca64fc7d96f1682f1f8099c'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${_buildver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
