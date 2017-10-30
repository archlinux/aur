# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja
pkgver=1.2.504
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url="https://github.com/pliablepixels/zmNinja"
license=('custom:cc-by-nc-sa-4.0' 'custom')
groups=()
depends=(gconf)
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
source=("https://github.com/pliablepixels/zmNinja/releases/download/v$pkgver/zmNinja-linux64bit.zip" "zmninja.desktop" "cc-by-nc-sa-4.0.txt" "zmninja.png")
noextract=()
sha256sums=("325d5ddcd7caf09365915b9a10983a033d10dca11e50b731c069156dc61f888d" "SKIP" "SKIP" "SKIP")
validpgpkeys=()

build() {
	:
}


package() {
	cd $pkgdir
	install -d usr/share/$pkgname
	cp -R $srcdir/zmNinja-linux64bit/* usr/share/$pkgname
	install -d usr/bin
	ln -s  /usr/share/$pkgname/zmNinja usr/bin/$pkgname

	install -D -m644 $srcdir/zmninja.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 usr/share/$pkgname/ZMNINJA-LICENSE-DESKTOP-CLIENT.txt usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/cc-by-nc-sa-4.0.txt usr/share/licenses/$pkgname/cc-by-nc-sa-4.0.txt
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/$pkgname.png
}
