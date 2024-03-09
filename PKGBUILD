# Maintainer: Visne <visne2 at proton dot me>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=rsiedit-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="C# GUI application for manipulation of RSI files used in SS14."
arch=("x86_64")
url="https://github.com/space-wizards/RSIEdit"
license=("MIT")
options=("!strip")
source=("Editor_Linux_$pkgver.zip::$url/releases/download/v$pkgver/Editor_Linux.zip"
        "RSIEdit.desktop"
	"RSIEdit.png")
sha256sums=('5c0edc669baa5e0e3aefe5f59fd59e319f30fa321e1dfc3a9ef180797407c4b8'
            '58c4554c6ada6b33d16f82a87301a2975f8ef2ca6247b3bab6bd8b8d76b92898'
            '56b7069383f1e839ce9aa14c8ca5e00bd089e3da85dd3ca774788d214c1fedea')

package() {
  install -Dm755 "$srcdir/Editor_Linux/Editor"			-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libHarfBuzzSharp.so"	-t "$pkgdir/opt/RSIEdit"
  install -Dm644 "$srcdir/Editor_Linux/libSkiaSharp.so"		-t "$pkgdir/opt/RSIEdit"

  install -Dm644 "RSIEdit.desktop" 				-t "$pkgdir/usr/share/applications"
  install -Dm644 "RSIEdit.png" 					-t "$pkgdir/usr/share/pixmaps"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/RSIEdit/Editor" "$pkgdir/usr/bin/rsiedit"
}

#vim: syntax=sh
