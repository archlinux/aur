# Maintainer: Moses Miller <Majora320@gmail.com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-x-bin
pkgver=4.2
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvstx')
optdepends=('jack')
suffix="Manjaro"
source=("$url/releases/download/$pkgver/LinVst-X-$pkgver-$suffix.zip")
md5sums=('99f3e4f222b3cbf503c440d8b642a1f8')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/linvstx.so" "$pkgdir/usr/share/LinVst/linvstx.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/lin-vst-server-x.exe"      "$pkgdir/usr/bin/lin-vst-server-x.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/lin-vst-server-x.exe.so" "$pkgdir/usr/bin/lin-vst-server-x.exe.so"

	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/lin-vst-server-x32.exe"   "$pkgdir/usr/bin/lin-vst-server-x32.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/lin-vst-server-x32.exe.so" "$pkgdir/usr/bin/lin-vst-server-x32.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-X-$pkgver-$suffix/linvstxconvert"   "$pkgdir/usr/bin/linvstxconvert"
}
