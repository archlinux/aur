# Maintainer: Kyle Bronsdon <kyle at silksow dot com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
pkgver=4.5
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
md5sums=('61288fcee325f2a04be8c1f5311b985c')

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
