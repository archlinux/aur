pkgname=gamejolt-client-bin
pkgver=0.48.7
pkgrel=1
epoch=
pkgdesc="GameJolt library of game"
arch=(x86_64)
url="https://gamejolt.com/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(	".manifest"
		"startgamejolt"
		"gamejolt.png"
		"GameJolt.desktop"
		"https://www.dropbox.com/s/r4uuxqx781j0m1a/game-jolt-client?dl=0"
		"https://www.dropbox.com/s/ql11hzb1vn76nhw/data-376715-852660.tar.gz?dl=0")
noextract=("data-376715-852660.tar.gz")
validpgpkeys=()

prepare() {
	echo $srcdir
	mv data-376715-852660.tar.gz?dl=0 data-376715-852660.tar.gz
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
	mkdir -pm777 $pkgdir/usr/share/gamejolt/	

	install -m775 startgamejolt		$pkgdir/usr/bin/
	install -m775 gamejolt.png		$pkgdir/usr/share/icons/
	install -m775 GameJolt.desktop	$pkgdir/usr/share/applications/
	install -m777 .manifest			$pkgdir/usr/share/gamejolt/
	install -m777 game-jolt-client	$pkgdir/usr/share/gamejolt/
	install -m777 data-376715-852660.tar.gz	$pkgdir/usr/share/gamejolt/

}
md5sums=('3a9a554baff1a5072910f9d6efb6c22a'
         '961eb10db3bb4893592b47376d5d91d7'
         '4c975528cb791ee16e5c62edbbf28287'
         'bc5ce421d3288c1982cade5a456a392e'
         'ca105e91b3013aa926c256491a661239'
         '0717965d086e41d832704457639aad96')

