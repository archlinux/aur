# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=rsiedit-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="C# GUI application for manipulation of RSI files used in SS14."
arch=("x86_64")
url="https://github.com/space-wizards/RSIEdit"
license=("MIT")
options=("!strip")
source=("Editor_Linux_$pkgver.zip::$url/releases/download/v$pkgver/Editor_Linux.zip"
        "RSIEdit.desktop"
	"RSIEdit.png")
sha256sums=('97b122f15225dda41c9a6d2814df59caf93c6c8b5a8da3b64fd957a6a03ff405'
            '58c4554c6ada6b33d16f82a87301a2975f8ef2ca6247b3bab6bd8b8d76b92898'
            '56b7069383f1e839ce9aa14c8ca5e00bd089e3da85dd3ca774788d214c1fedea')

package() {
  install -Dm755 "$srcdir/Editor_Linux/Editor"			-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libHarfBuzzSharp.so"	-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libSkiaSharp.so"		-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/Editor.pdb"		-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/Importer.pdb"		-t "$pkgdir/opt/RSIEdit"

  install -Dm644 "RSIEdit.desktop" 				-t "$pkgdir/usr/share/applications"
  install -Dm644 "RSIEdit.png" 					-t "$pkgdir/usr/share/pixmaps"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/RSIEdit/Editor" "$pkgdir/usr/bin/rsiedit"
}

#vim: syntax=sh
