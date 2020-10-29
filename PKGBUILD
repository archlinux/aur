# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
pkgver=3.15
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst')
optdepends=('jack')
source=( "https://github.com/osxmidi/LinVst/releases/download/$pkgver/LinVst-$pkgver.zip") 
md5sums=('6b7734ffe4cef078f60700037ca5640c')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-$pkgver/embedded/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-$pkgver/embedded/lin-vst-servertrack.exe"      "$pkgdir/usr/bin/lin-vst-servertrack.exe"
	install -Dm755 "$srcdir/LinVst-$pkgver/embedded/lin-vst-servertrack.exe.so"   "$pkgdir/usr/bin/lin-vst-servertrack.exe.so"

	install -Dm755 "$srcdir/LinVst-$pkgver/embedded/lin-vst-servertrack32.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack32.exe.so"
	install -Dm755 "$srcdir/LinVst-$pkgver/embedded/lin-vst-servertrack32.exe" "$pkgdir/usr/bin/lin-vst-servertrack32.exe"

	# Converter
	install -Dm755 "$srcdir/LinVst-$pkgver/convert/linvstconvert"   "$pkgdir/usr/bin/linvstconvert"
	install -Dm755 "$srcdir/LinVst-$pkgver/convert/linvstconverttree" "$pkgdir/usr/bin/linvstconverttree"
}
