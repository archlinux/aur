pkgname=gamejolt-client-bin
pkgver=0.52.3
pkgrel=1
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
source=(	".manifest"
		"startgamejolt"
		"gamejolt.png"
		"GameJolt.desktop"
		"https://www.dropbox.com/s/gqgc2g82piosw0x/game-jolt-client?dl=0"
		"https://www.dropbox.com/s/ys3feo3hhd3nsx3/data-376715-879203.tar.gz?dl=0")
noextract=()
validpgpkeys=()

prepare() {
	echo $srcdir
	mv data-376715-879203.tar.gz?dl=0 data-376715-879203.tar.gz
	mv game-jolt-client?dl=0 game-jolt-client
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
	bsdtar -C $pkgdir/opt/gamejolt/ -xf data-376715-879203.tar.gz

}
md5sums=('25087ad57c3c1aef436c42b24ab51bf9'
         '2b11324ddd227249714b8173a3b3a97d'
         '4c975528cb791ee16e5c62edbbf28287'
         'bc5ce421d3288c1982cade5a456a392e'
         'abb29899371c605956f6f36b54f610f4'
         '759908ea23176325debf0d39fe73fe63')
