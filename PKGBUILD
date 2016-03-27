# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
pkgname=mayday
pkgver=2.14
pkgrel=1
pkgdesc="A workbench for visualization, analysis and storage of microarray data."
arch=(any)
url="http://it.inf.uni-tuebingen.de/?page_id=248"
license=('GPL')
groups=()
depends=('sh' 'java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("http://it.informatik.uni-tuebingen.de/software/${pkgname}/${pkgname}-download/${pkgname}-${pkgver}_stable.zip"
        "mayday"
        "mayday.desktop")
noextract=()
md5sums=('343ac5fb6ab62abf7789223546f66590'
         '0ef9f9cd41bfa8664f27606eec4126fe'
         '13d6a6b666f9c6523e776942fdaa3d04')
validpgpkeys=()

package() {
	install -dm755 $pkgdir/usr/share/java/mayday
	# jar file
	install -Dm644 $pkgname-$pkgver/core-2.14.jar $pkgdir/usr/share/java/mayday
	# plugins directory
	cp -r $pkgname-$pkgver/plugins $pkgdir/usr/share/java/mayday
	chmod 644 $pkgdir/usr/share/java/mayday/plugins/*
	# script to launch
	install -Dm755 mayday $pkgdir/usr/bin/mayday
	# desktop file
	install -Dm755 mayday.desktop "$pkgdir/usr/share/applications/mayday.desktop"
}
