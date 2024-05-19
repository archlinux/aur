# Maintainer: paradoxxx.zero <paradoxxx.zero@gmail.com>

pkgname=zed-editor-preview-bin
pkgver=0.136.2
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. (binary package)"
arch=('x86_64')
url="https://github.com/zed-industries/zed"
license=('GPL3')
depends=("alsa-lib" "gcc-libs" "glibc" "libxau" "libxcb" "libxdmcp" "libxkbcommon" "libxkbcommon-x11" "zlib")
_filename="zed-linux-${CARCH}.tar.gz"
_appdir="zed-preview.app"
source=("$pkgname-$pkgver.tar.gz::https://zed.dev/api/releases/preview/${pkgver}/${_filename}")
sha256sums=('55a7065b0432f388927940715887403464634827b09304cd648048acd7d1d979')
provides=(zed-editor)
conflicts=(zed-editor)

package() {
  tar -xv -f "$srcdir/$pkgname-$pkgver.tar.gz"
  cd "${_appdir}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bin/zed"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bin/cli"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "share/applications/zed-preview.desktop"
  cp -r "share/icons" "$pkgdir/usr/share/"
}
