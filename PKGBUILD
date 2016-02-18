
# Maintainer: Andre Bauer <novamoon@ts.3v.fi>
pkgname=jeveassets
pkgver=2.10.5
pkgrel=4
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
depends=('jdk7-openjdk' 'unzip')
install=$pkgname.install
source=("http://eve.nikr.net/jeveassets/jeveassets-2.10.5.zip"
"$pkgname.desktop" "$pkgname.png" "$pkgname.sh")
md5sums=('3fecd6861e609ebc574e6bb822e7a5f6'
         'fe76109bee617582dc94e35a572070d6'
         '706a6b2856a3aa9e26952078534faa8d'
         '349f0b0edae2c5df570142d43071a7f1')


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
