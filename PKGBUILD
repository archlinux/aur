#Maintainer: XanatosX <wk9mtc0ar@mozmail.com>
name=samory
pkgname=$name-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A Memory like game, written in Godot. Does allow custom card decks to be side loaded."
arch=("x86_64")
url="https://github.com/D-Generation-S/Samory"
license=('MIT')
groups=('kde-games')
depends=()
source=("https://github.com/D-Generation-S/${name}/releases/download/${pkgver}/${name}_${pkgver}-linux.zip" 
		"samory.desktop" 
		"https://github.com/D-Generation-S/${name}/raw/refs/tags/${pkgver}/samory-icon.png")
md5sums=('e4015aca1e15cd162067d7c55c0ae430'
         'c1a3c96fb0da1dcc184599b043e040ff'
         '17d8d7ab75053364aa48bf150f048977')

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/$name"				"$pkgdir/opt/$pkgname/$name" 
	install -Dm755 "$srcdir/$name.desktop"		"$pkgdir/usr/share/applications/$name.desktop"
	install -Dm644 "$srcdir/${name}-icon.png"	"$pkgdir/usr/share/pixmaps/${name}-icon.png"
	install -Dm644 "$srcdir/$name.pck"			"$pkgdir/opt/$pkgname/$name.pck"

	ln -sf "/opt/$pkgname/$name" "$pkgdir/usr/bin/$name"
}


