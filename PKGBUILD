pkgname=gb-emu-zig-git
pkgver=0
pkgrel=1
pkgdesc="GameBoy emulator in zig"
arch=("x86_64")
url="https://github.com/Ryp/gb-emu-zig"
license=('MIT')
depends=("sdl2")
makedepends=("zig" "git")
conflicts=("gb-emu-zig")
provides=("gb-emu-zig")
source=("git+https://github.com/Ryp/gb-emu-zig.git")
sha512sums=(SKIP)

build() {
  cd "${srcdir}/gb-emu-zig"
  zig build install -Doptimize=ReleaseSmall
}

package() {
 cd "${srcdir}/gb-emu-zig"
 zig build install -Doptimize=ReleaseSmall --prefix "${pkgdir}/usr"
 rm "${pkgdir}"/usr/bin/test
 install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/gb-emu-zig/LICENSE.md"
}
