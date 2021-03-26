# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-x-bin
pkgver=4.0
pkgrel=5
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst3x')
optdepends=('jack')
_suffix="Debian-Stretch"
source=("$url/releases/download/$pkgver/LinVst3-X-$pkgver-$_suffix.zip")
md5sums=('d093dcb6f1316ed9a6399be05d0e1147')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$_suffix/embedded/linvst3x.so" "$pkgdir/usr/share/LinVst/linvst3x.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$_suffix/embedded/lin-vst3-server-x.exe" "$pkgdir/usr/bin/lin-vst3-server-x.exe"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$_suffix/embedded/lin-vst3-server-x.exe.so" "$pkgdir/usr/bin/lin-vst3-server-x.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$_suffix/convert/linvst3xconvert" "$pkgdir/usr/bin/linvst3xconvert"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$_suffix/convert/linvst3xconverttree" "$pkgdir/usr/bin/linvst3xconverttree"
}

