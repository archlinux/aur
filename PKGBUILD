# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-bin
pkgver=4.5.2
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
source=("https://github.com/osxmidi/LinVst3/releases/download/4.5/LinVst3-4.5.2-Manjaro.zip")
md5sums=('f777fa8eddb5b3c6ab7badd8cc9c7218')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/linvst3.so" "$pkgdir/usr/share/LinVst/linvst3.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/lin-vst3-servertrack.exe" "$pkgdir/usr/bin/lin-vst3-servertrack.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/lin-vst3-servertrack.exe.so" "$pkgdir/usr/bin/lin-vst3-servertrack.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/linvst3convert" "$pkgdir/usr/bin/linvst3convert"

	#test
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/TestVst3/testvst3.exe" "$pkgdir/usr/bin/testvst3.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/TestVst3/testvst3.exe.so" "$pkgdir/usr/bin/testvst3.exe.so"


}
