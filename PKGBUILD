# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-bin
pkgver=4.2
pkgrel=1
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst3')
optdepends=('jack')
suffix="Manjaro"
source=("$url/releases/download/$pkgver/LinVst3-$pkgver-$suffix.zip")
md5sums=('1ca552736f43c73232d736a8e63a4214')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/linvst3.so" "$pkgdir/usr/share/LinVst/linvst3.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/lin-vst3-servertrack.exe" "$pkgdir/usr/bin/lin-vst3-servertrack.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/lin-vst3-servertrack.exe.so" "$pkgdir/usr/bin/lin-vst3-servertrack.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/linvst3convert" "$pkgdir/usr/bin/linvst3convert"

	#test
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/TestVst3/testvst3.exe" "$pkgdir/usr/bin/estvst3.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/TestVst3/testvst3.exe.so" "$pkgdir/usr/bin/testvst3.exe.so"


}
