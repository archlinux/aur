# Maintainer: paradoxxx.zero <paradoxxx.zero@gmail.com>

pkgname=zed-editor-preview-bin
pkgver=0.138.3
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. (binary package)"
arch=('x86_64')
url="https://github.com/zed-industries/zed"
license=('GPL3')
depends=("alsa-lib" "gcc-libs" "glibc" "libxau" "libxcb" "libxdmcp" "libxkbcommon" "libxkbcommon-x11" "zlib")
_filename="zed-linux-${CARCH}.tar.gz"
_appdir="zed-preview.app"
source=("$pkgname-$pkgver.tar.gz::https://github.com/zed-industries/zed/releases/download/v0.138.3-pre/zed-linux-x86_64.tar.gz")
sha256sums=('8efdd078e899e104008c4b2d598f0c2bbde75698af44fb780081eb52649c6d97')
provides=(zed-editor)
conflicts=(zed-editor)
options=(!strip !debug)

package() {
  tar -xv -f "$srcdir/$pkgname-$pkgver.tar.gz" "${_appdir}/bin" "${_appdir}/share"
  cd "${_appdir}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "bin/zed"
  install -Dm0755 -t "$pkgdir/usr/bin/" "bin/cli"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "share/applications/zed-preview.desktop"
  cp -r "share/icons" "$pkgdir/usr/share/"
}
