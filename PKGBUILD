# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.6.0+c8cd6145a

pkgname=zig-dev-bin
pkgver=20200924
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
  '7d8f00343cc36c3160d85fae42c8c57c973eb51152119303f1c397284e6a9248'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${_buildver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
