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
	
	install -Dm775 startgamejolt				$pkgdir/usr/bin/startgamejolt
	install -Dm775 gamejolt.png				$pkgdir/usr/share/icons/gamejolt.png
	install -Dm775 GameJolt.desktop			$pkgdir/usr/share/applications/GameJolt.desktop
	install -Dm777 .manifest					$pkgdir/opt/gamejolt/.manifest
	install -Dm777 game-jolt-client			$pkgdir/opt/gamejolt/game-jolt-client
	mv data-376715-921845					$pkgdir/opt/gamejolt
	chmod 777 $pkgdir/opt/gamejolt/data-376715-921845

}
md5sums=('2b11324ddd227249714b8173a3b3a97d'
         '4c975528cb791ee16e5c62edbbf28287'
         'bc5ce421d3288c1982cade5a456a392e'
         '5d7a015d54c4f92b68b760dee9b7519a')
