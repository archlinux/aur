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
suffix="Debian-Stretch"
source=("$url/releases/download/$pkgver/LinVst3-$pkgver-$suffix.zip")
md5sums=('dac2d1f3f6c36a4a242a0d9d734337ee')

package() {

	# Shared library
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/embedded/linvst3.so" "$pkgdir/usr/share/LinVst/linvst3.so"

	# Embedded
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/embedded/lin-vst3-servertrack.exe" "$pkgdir/usr/bin/lin-vst3-servertrack.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/embedded/lin-vst3-servertrack.exe.so" "$pkgdir/usr/bin/lin-vst3-servertrack.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/convert/linvst3convert" "$pkgdir/usr/bin/linvst3convert"
	install -Dm755 "$srcdir/LinVst3-$pkgver-$suffix/convert/linvst3converttree" "$pkgdir/usr/bin/linvst3converttree"

}
