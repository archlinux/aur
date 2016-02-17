
# Maintainer: Andre Bauer <novamoon@ts.3v.fi>
pkgname=jeveassets
pkgver=2.10.5
pkgrel=2
epoch=
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
groups=()
depends=('jdk7-openjdk' 'unzip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("http://eve.nikr.net/jeveassets/jeveassets-2.10.5.zip"
"$pkgname.sh" "$pkgname.desktop" "$pkgname.png")
md5sums=('3fecd6861e609ebc574e6bb822e7a5f6'
         '349f0b0edae2c5df570142d43071a7f1'
         'ce151aef1f56dee1dc155f8dc14ffd4a'
         '706a6b2856a3aa9e26952078534faa8d')


package() {

	install -d "$pkgdir/opt/"
	cp -dr --no-preserve=ownership "$srcdir/jEveAssets" "$pkgdir/opt/"

	install -d "$pkgdir/usr/bin/"
	cp -dr --no-preserve=ownership "$srcdir/jeveassets.sh" "$pkgdir/usr/bin"
	
	install -Dm755 "$startdir/jeveassets.sh" "$pkgdir/usr/bin/jeveassets.sh"

	install -d "$pkgdir/usr/share/applications/"
	cp -dr --no-preserve=ownership "$srcdir/jeveassets.desktop" "$pkgdir/usr/share/applications/"

	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
