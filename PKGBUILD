# Maintainer: Kyle Bronsdon <kyle at silksow dot com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
pkgver=4.2
pkgrel=1
pkgdesc="Linux Windows vst wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst')
optdepends=('jack')
suffix="Manjaro"
source=( "$url/releases/download/$pkgver/LinVst-$pkgver-$suffix.zip") 
md5sums=('22e132e1c3529979a5a5ca0a77cc2e50')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack.exe"      "$pkgdir/usr/bin/lin-vst-servertrack.exe"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack.exe.so"   "$pkgdir/usr/bin/lin-vst-servertrack.exe.so"

	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack32.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack32.exe.so"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack32.exe" "$pkgdir/usr/bin/lin-vst-servertrack32.exe"

	# Converter
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/linvstconvert"   "$pkgdir/usr/bin/linvstconvert"
	#install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/convert/linvstconverttree" "$pkgdir/usr/bin/linvstconverttree"
}
