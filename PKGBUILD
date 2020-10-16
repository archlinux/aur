# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.6.0+f3667e8a8

pkgname=zig-dev-bin
pkgver=20201016
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
  '704fc584168590d989986c73a994bdf89a935aac3d757599a1d6db1bfcb52b32'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${_buildver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
