# Maintainer: Kyle Bronsdon <kyle at silksow dot com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst-bin
majorVersion=4.5
pkgver="$majorVersion".2
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
source=("$url/releases/download/$majorVersion/LinVst-$pkgver-$suffix.zip")
md5sums=('0e3867adee61612e3cb67c7fa3ad1088')

package() {
	# Shared library
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/linvst.so" "$pkgdir/usr/share/LinVst/linvst.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack.exe" "$pkgdir/usr/bin/lin-vst-servertrack.exe"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack.exe.so"

	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack32.exe.so" "$pkgdir/usr/bin/lin-vst-servertrack32.exe.so"
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/lin-vst-servertrack32.exe" "$pkgdir/usr/bin/lin-vst-servertrack32.exe"

	# Converter
	install -Dm755 "$srcdir/LinVst-$pkgver-$suffix/linvstconvert" "$pkgdir/usr/bin/linvstconvert"
}
