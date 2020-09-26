# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-bin
pkgver=2.1
pkgrel=1
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3"
license=('GPL')
groups=('pro_audio')
depends=('wine' 'gtk3')
conflicts=('linvst3')
optdepends=('jack')
source=("https://github.com/osxmidi/LinVst3/releases/download/$pkgver/LinVst3-$pkgver-Debian-rz.zip")
md5sums=('a7fd6a3c6eafab840ba6902da52370ff')

package() {

	# Embedded
	install -Dm755 "$srcdir/LinVst3-$pkgver-Debian-rz/embedded/linvst3.so" "$pkgdir/usr/bin/linvst3.so"
	install -Dm755 "$srcdir/LinVst3-$pkgver-Debian-rz/embedded/lin-vst3-servertrack.exe" "$pkgdir/usr/bin/lin-vst3-servertrack.exe"
	install -Dm755 "$srcdir/LinVst3-$pkgver-Debian-rz/embedded/lin-vst3-servertrack.exe.so" "$pkgdir/usr/bin/lin-vst3-servertrack.exe.so"

	# Converter
	install -Dm755 "$srcdir/LinVst3-$pkgver-Debian-rz/convert/linvst3convert" "$pkgdir/usr/bin/linvst3convert"
	install -Dm755 "$srcdir/LinVst3-$pkgver-Debian-rz/convert/linvst3converttree" "$pkgdir/usr/bin/linvst3converttree"

}
