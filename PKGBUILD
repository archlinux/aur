pkgname=gamejolt-client-bin
pkgver=0.57.0
pkgrel=1
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
source=("startgamejolt"
		"gamejolt.png"
		"GameJolt.desktop"
		"gamejolt-$pkgver::https://f-cdn.gamejolt.net/data/games/5/162/362412/protected-files-cdn/5f9c532ec81b9/gamejoltclient.tar.gz?secure=7TVKCt5yPQaw5Z-eg0qqcg%2C1604394296")
noextract=()
validpgpkeys=()

prepare() {
	echo $srcdir
}

build() {
	echo no build
}

check() {
	echo no check
}

package() {
	cd $srcdir
	
	mkdir -pm775 $pkgdir/usr/bin/
	mkdir -pm775 $pkgdir/usr/share/icons/
	mkdir -pm775 $pkgdir/usr/share/applications/
	mkdir -pm777 $pkgdir/opt/gamejolt/	

	install -m775 startgamejolt		       $pkgdir/usr/bin/
	install -m775 gamejolt.png		       $pkgdir/usr/share/icons/
	install -m775 GameJolt.desktop	       $pkgdir/usr/share/applications/
	install -m777 .manifest			       $pkgdir/opt/gamejolt/
	install -m777 game-jolt-client	       $pkgdir/opt/gamejolt/
	mv data-376715-921845 $pkgdir/opt/gamejolt
}
md5sums=('2b11324ddd227249714b8173a3b3a97d'
         '4c975528cb791ee16e5c62edbbf28287'
         'bc5ce421d3288c1982cade5a456a392e'
         '5d7a015d54c4f92b68b760dee9b7519a')
