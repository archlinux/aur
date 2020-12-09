# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-x-bin
pkgver=3.2
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvstx')
optdepends=('jack')
suffix="Debian-Stretch"
source=("$url/releases/download/$pkgver/LinVst-X-$pkgver-$suffix.zip")
md5sums=('696db70152b8f0bafab421233b4fc071')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/embedded/linvstx.so" "$pkgdir/usr/share/LinVst/linvstx.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/embedded/lin-vst-server-x.exe"      "$pkgdir/usr/bin/lin-vst-server-x.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/embedded/lin-vst-server-x.exe.so" "$pkgdir/usr/bin/lin-vst-server-x.exe.so"

	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/embedded/lin-vst-server-x32.exe"   "$pkgdir/usr/bin/lin-vst-server-x32.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/embedded/lin-vst-server-x32.exe.so" "$pkgdir/usr/bin/lin-vst-server-x32.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/convert/linvstxconvert"   "$pkgdir/usr/bin/linvstxconvert"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/convert/linvstxconverttree" "$pkgdir/usr/bin/linvstxconverttree"

}
