# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-x-bin
pkgver=2.15
pkgrel=4
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst3x')
optdepends=('jack')
suffix="Debian-Stretch"
source=("$url/releases/download/$pkgver/LinVst3-X-$pkgver-$suffix.zip")
md5sums=('8dbd70dd0d7ab51928bbbf029beb7c92')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$suffix/embedded/linvst3x.so" "$pkgdir/usr/share/LinVst/linvst3x.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$suffix/embedded/lin-vst3-server-x.exe" "$pkgdir/usr/bin/lin-vst3-server-x.exe"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$suffix/embedded/lin-vst3-server-x.exe.so" "$pkgdir/usr/bin/lin-vst3-server-x.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$suffix/convert/linvst3xconvert" "$pkgdir/usr/bin/linvst3xconvert"
	install -Dm755 "$srcdir/LinVst3-X-$pkgver-$suffix/convert/linvst3xconverttree" "$pkgdir/usr/bin/linvst3xconverttree"
}

