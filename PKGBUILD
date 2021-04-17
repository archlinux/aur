# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvst3-x-bin
pkgver=4.2
pkgrel=1
pkgdesc="Linux Windows vst3 wrapper/bridge"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3-X"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'gtk3')
conflicts=('linvst3x')
optdepends=('jack')
suffix=Manjaro
source=("$url/releases/download/$pkgver/LinVst3-X-$pkgver-$_suffix.zip")
md5sums=('cbe75292d36afca9a06813d3919d58d3')

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

