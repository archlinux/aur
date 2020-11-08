# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
pkgver=3.15
pkgrel=3
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst')
optdepends=('jack')
suffix="Debian-Stretch"
source=( "$url/releases/download/$pkgver/LinVst-$pkgver-$suffix.zip") 
md5sums=('27fab2243c15df1e83a0ef3611adafae')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/embedded/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/embedded/lin-vst-servertrack.exe"      "$pkgdir/usr/bin/lin-vst-servertrack.exe"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/embedded/lin-vst-servertrack.exe.so"   "$pkgdir/usr/bin/lin-vst-servertrack.exe.so"

	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/embedded/lin-vst-servertrack32.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack32.exe.so"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/embedded/lin-vst-servertrack32.exe" "$pkgdir/usr/bin/lin-vst-servertrack32.exe"

	# Converter
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/convert/linvstconvert"   "$pkgdir/usr/bin/linvstconvert"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/convert/linvstconverttree" "$pkgdir/usr/bin/linvstconverttree"
}
