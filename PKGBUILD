# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
pkgver=3.1
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst')
optdepends=('jack')
source=("https://github.com/osxmidi/LinVst/releases/download/$pkgver/LinVst-$pkgver-Debian-rz.zip")
md5sums=('c679ab480c3954ff9a6d7cae21bb779f')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/embedded/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/embedded/lin-vst-servertrack.exe"      "$pkgdir/usr/bin/lin-vst-servertrack.exe"
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/embedded/lin-vst-servertrack.exe.so"   "$pkgdir/usr/bin/lin-vst-servertrack.exe.so"

	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/embedded/lin-vst-servertrack32.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack32.exe.so"
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/embedded/lin-vst-servertrack32.exe" "$pkgdir/usr/bin/lin-vst-servertrack32.exe"

	# Converter
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/convert/linvstconvert"   "$pkgdir/usr/bin/linvstconvert"
	install -Dm755 "$srcdir/LinVst-$pkgver-Debian-rz/convert/linvstconverttree" "$pkgdir/usr/bin/linvstconverttree"
}
