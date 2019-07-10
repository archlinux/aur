# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zig-dev-static
pkgver=0.4.0+ae2345b7
pkgrel=1
pkgdesc="robust, optimal, and maintainable programming language"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig')
conflicts=('zig')
source=(
  "https://ziglang.org/builds/zig-linux-x86_64-${pkgver}.tar.xz"
)
sha256sums=(
  '66f4d7bdf019962286bf47664b6df949cb9d3d7abb688f361d57399ca9ac9aa9'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${pkgver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
