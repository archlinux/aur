# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zig-dev-static
pkgver=0.4.0+ceec2393
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
  'c52a69ee920a6c218c4ec7cf79ab12122e0a4f8a849aa789e54962e51033752e'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${pkgver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
