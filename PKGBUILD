# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=rsiedit-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="C# GUI application for manipulation of RSI files used in SS14."
arch=("x86_64")
url="https://github.com/space-wizards/RSIEdit"
license=("MIT")
provides=("rsiedit")
options=("!strip")
source=("$url/releases/download/v$pkgver/Editor_Linux.zip")
sha256sums=('9c891736a2fdc583f8d71a56b965ffdda409ce8b691a2af735ced16a27bd2dd7')

package() {
  install -Dm755 "$srcdir/Editor_Linux/Editor"			-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libHarfBuzzSharp.so"	-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libSkiaSharp.so"		-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/Editor.pdb"		-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/Importer.pdb"		-t "$pkgdir/opt/RSIEdit"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/RSIEdit/Editor" "$pkgdir/usr/bin/rsiedit"
}

#vim: syntax=sh
