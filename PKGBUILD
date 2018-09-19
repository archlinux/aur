# Maintainer: Denis Borisevich <elfmax@tut.by>

pkgname=jeveassets
pkgver=5.7.4
pkgrel=1
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
depends=('jre8-openjdk' 'unzip')
install=$pkgname.install

source=("https://github.com/GoldenGnu/jeveassets/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip"
        "https://eve.nikr.net/${pkgname}/data.zip"
        "$pkgname.desktop" "$pkgname.png" "$pkgname.sh")
md5sums=('bd6923d5ac6ceca33e3092de3ae8201f'
         '39e15b992593300e77cc88d48c506961'
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
