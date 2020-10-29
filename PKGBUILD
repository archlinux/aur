# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-x-bin
pkgver=3.15
pkgrel=2
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvstx')
optdepends=('jack')
source=("https://github.com/osxmidi/LinVst-X/releases/download/$pkgver/LinVst-X-$pkgver.zip")
md5sums=('0bf7534035efa47b7c0728125ef103bf')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst-X-$pkgver/embedded/linvstx.so" "$pkgdir/usr/share/LinVst/linvstx.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-X-$pkgver/embedded/lin-vst-server-x.exe"      "$pkgdir/usr/bin/lin-vst-server-x.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver/embedded/lin-vst-server-x.exe.so" "$pkgdir/usr/bin/lin-vst-server-x.exe.so"

	install -Dm755 "$srcdir/LinVst-X-$pkgver/embedded/lin-vst-server-x32.exe"   "$pkgdir/usr/bin/lin-vst-server-x32.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver/embedded/lin-vst-server-x32.exe.so" "$pkgdir/usr/bin/lin-vst-server-x32.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-X-$pkgver/convert/linvstxconvert"   "$pkgdir/usr/bin/linvstxconvert"
	install -Dm755 "$srcdir/LinVst-X-$pkgver/convert/linvstxconverttree" "$pkgdir/usr/bin/linvstxconverttree"

}
