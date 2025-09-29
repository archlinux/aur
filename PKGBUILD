#Maintainer: XanatosX <wk9mtc0ar@mozmail.com>
name=samory
pkgname=$name-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A Memory like game, written in Godot. Does allow custom card decks to be side loaded."
arch=("x86_64")
url="https://github.com/D-Generation-S/Samory"
license=('MIT')
groups=('kde-games')
depends=()
source=("https://github.com/D-Generation-S/${name}/releases/download/${pkgver}/${name}_${pkgver}-linux.zip" 
		"samory.desktop" 
		"https://github.com/D-Generation-S/${name}/raw/refs/tags/${pkgver}/assets/sprites/Axuree/samory-icon.png")
md5sums=('8fc5e9dec5181413c67c9f74a631a74f'
         'c1a3c96fb0da1dcc184599b043e040ff'
         '43b9124387dac78647878f6137ed4542')

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/$name"				"$pkgdir/opt/$pkgname/$name" 
	install -Dm755 "$srcdir/$name.desktop"		"$pkgdir/usr/share/applications/$name.desktop"
	install -Dm644 "$srcdir/${name}-icon.png"	"$pkgdir/usr/share/pixmaps/${name}-icon.png"
	install -Dm644 "$srcdir/$name.pck"			"$pkgdir/opt/$pkgname/$name.pck"

	ln -sf "/opt/$pkgname/$name" "$pkgdir/usr/bin/$name"
}


