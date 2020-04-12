# Maintainer: Matt Knight <mattnite@protonmail.com>

pkgname=zig-master
pkgver="0.5.0+f79faf900"
pkgrel=1
pkgdesc="Master build of static zig compiler"
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://ziglang.org/"
provides=('zig')
conflicts=('zig')
source=("https://ziglang.org/builds/zig-linux-${arch}-${pkgver}.tar.xz")

case $arch in
  x86_64)
    sha256sums+=("234ae3c4c58cb302a463d0e001e66ca5470c09cc0c2cb32f630f1323b029a4db")
    ;;
  aarch64)
    sha256sums+=("acda686789ef51ecb6435ef6e21711188bf4f300adafe43390e369c78d52385c")
    ;;
esac

package() {
  cd "${srcdir}/zig-linux-x86_64-${pkgver}"
  install -D -m755 zig "${pkgdir}/usr/bin/zig"
  cp -R lib "${pkgdir}/usr"
  install -D -m644 langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
