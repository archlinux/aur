# Maintainer: paradoxxx.zero <paradoxxx.zero@gmail.com>

pkgname=zed-editor-preview-bin
pkgver=0.134.1
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. (binary package)"
arch=('x86_64')
url="https://github.com/zed-industries/zed"
license=('GPL3')
_filename="zed-linux-${CARCH}.tar.gz"
_appdir="zed-preview.app"
source=("$pkgname-$pkgver.tar.gz::https://zed.dev/api/releases/preview/${pkgver}/${_filename}")
sha256sums=('f18dc8b2095b0bbdd6e9fec09ca9635f12ab1ac30f28a6d3b7b9615490859393')
provides=(zed-editor)
conflicts=(zed-editor)

package() {
  tar -xv -f "$srcdir/$pkgname-$pkgver.tar.gz"
  cd "${_appdir}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bin/zed"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "share/applications/zed-preview.desktop"
  cp -r "share/icons" "$pkgdir/usr/share/"
}
