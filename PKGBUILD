# Maintainer: Carlos E. Garcia <carlos@cgarcia.org>

pkgname=jeveassets
pkgver=4.0.1
pkgrel=1
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
depends=('jre8-openjdk' 'unzip')
install=$pkgname.install
source=("http://eve.nikr.net/${pkgname}/${pkgname}-${pkgver}.zip"
        "$pkgname.desktop" "$pkgname.png" "$pkgname.sh")
md5sums=('582b96fb144e84bc80e11c572c8ef0ec'
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
