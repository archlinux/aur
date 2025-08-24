#Maintainer: XanatosX <wk9mtc0ar@mozmail.com>
name=samory
pkgname=$name-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A Memory like game, written in Godot. Does allow custom card decks to be side loaded."
arch=("x86_64")
url="https://github.com/D-Generation-S/Samory"
license=('MIT')
groups=('kde-games')
depends=("bash")
source=("https://github.com/D-Generation-S/${name}/releases/download/${pkgver}/${name}_${pkgver}-linux.zip" "samory.desktop")
md5sums=("57c218a1479443f54f5cb0c0e8a43670" "SKIP")

prepare() {
	cd $srcdir
}


package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/$name"     "$pkgdir/opt/$pkgname/$name" 
	install -Dm755 "$srcdir/$name.desktop"     "$pkgdir/usr/share/applications/$name.desktop"
	install -Dm644 "$srcdir/$name.pck" "$pkgdir/opt/$pkgname/$name.pck"

	ln -sf "/opt/$pkgname/$name" "$pkgdir/usr/bin/$name"
}


