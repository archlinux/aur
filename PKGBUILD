# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-x-bin
pkgver=2.1
pkgrel=1
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3x"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst3x')
optdepends=('jack')
source=("https://github.com/osxmidi/LinVst3-X/releases/download/$pkgver/LinVst3-X-$pkgver-Debian-rz.zip")
md5sums=('727c8ba45c8c71cf912be17e5396ae7f')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-Debian-rz/embedded/linvst3x.so" "$pkgdir/usr/share/LinVst/linvst3x.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-Debian-rz/embedded/lin-vst3-server-x.exe" "$pkgdir/usr/bin/lin-vst3-server-x.exe"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-Debian-rz/embedded/lin-vst3-server-x.exe.so" "$pkgdir/usr/bin/lin-vst3-server-x.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-Debian-rz/convert/linvst3xconvert" "$pkgdir/usr/bin/linvst3xconvert"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-Debian-rz/convert/linvst3xconverttree" "$pkgdir/usr/bin/linvst3xconverttree"
}

