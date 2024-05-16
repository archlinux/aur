# Maintainer: paradoxxx.zero <paradoxxx.zero@gmail.com>

pkgname=zed-editor-preview-bin
pkgver=0.136.0
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. (binary package)"
arch=('x86_64')
url="https://github.com/zed-industries/zed"
license=('GPL3')
depends=("alsa-lib" "gcc-libs" "glibc" "libxau" "libxcb" "libxdmcp" "libxkbcommon" "libxkbcommon-x11" "zlib")
_filename="zed-linux-${CARCH}.tar.gz"
_appdir="zed-preview.app"
source=("$pkgname-$pkgver.tar.gz::https://zed.dev/api/releases/preview/${pkgver}/${_filename}")
sha256sums=('650c44c4561d62b005e3ee85aad3c44eb2589a7e376879ea5e4df42b6d6b4ff1')
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
