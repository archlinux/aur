# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_buildver=0.6.0+e17297102

pkgname=zig-dev-bin
pkgver=20201022
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
  '6dcf5960d642141197775632af3e435f8eba62773accf1414e26f2c029fe58e0'
)

package() {
    cd "${srcdir}/zig-linux-x86_64-${_buildver}"
    install -D -m755 zig "${pkgdir}/usr/bin/zig"
    cp -R lib "${pkgdir}/usr"
    install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
