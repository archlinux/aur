# Maintainer: Moses Miller <Majora320@gmail.com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-x-bin
pkgver=4.7.1
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvstx')
optdepends=('jack')
source=("$url/releases/download/$pkgver/LinVst-X-$pkgver.zip")
md5sums=('c2f36ae608b595b013239bcf3dd67b9b')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-X-$pkgver/linvstx.so" "$pkgdir/usr/share/LinVst/linvstx.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-X-$pkgver/lin-vst-server-x.exe"      "$pkgdir/usr/bin/lin-vst-server-x.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver/lin-vst-server-x.exe.so" "$pkgdir/usr/bin/lin-vst-server-x.exe.so"

	install -Dm755 "$srcdir/LinVst-X-$pkgver/lin-vst-server-x32.exe"   "$pkgdir/usr/bin/lin-vst-server-x32.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver/lin-vst-server-x32.exe.so" "$pkgdir/usr/bin/lin-vst-server-x32.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-X-$pkgver/linvstxconvert"   "$pkgdir/usr/bin/linvstxconvert"
}
