# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-x-bin
pkgver=3.1
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst-X"
license=('GPL')
depends=('wine' 'gtk3')
conflicts=('linvst-x')
optdepends=('jack')
source=("https://github.com/osxmidi/LinVst-X/releases/download/$pkgver/LinVst-X-$pkgver-Debian-rz.zip")
md5sums=('c40316afaa2b99fe95863209417b5c64')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/embedded/linvstx.so" "$pkgdir/usr/share/LinVst/linvstx.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/embedded/lin-vst-server-x.exe"      "$pkgdir/usr/bin/lin-vst-server-x.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/embedded/lin-vst-server-x.exe.so" "$pkgdir/usr/bin/lin-vst-server-x.exe.so"

	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/embedded/lin-vst-server-x32.exe"   "$pkgdir/usr/bin/lin-vst-server-x32.exe"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/embedded/lin-vst-server-x32.exe.so" "$pkgdir/usr/bin/lin-vst-server-x32.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/convert/linvstxconvert"   "$pkgdir/usr/bin/linvstxconvert"
	install -Dm755 "$srcdir/LinVst-X-$pkgver-Debian-rz/convert/linvstxconverttree" "$pkgdir/usr/bin/linvstxconverttree"

}
