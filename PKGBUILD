# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgbase=mse-mtg
pkgname=("$pkgbase" "$pkgbase-new" "$pkgbase-m15")
pkgver=2.0.0
pkgrel=9
pkgdesc="Magic: the Gathering templates for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
conflicts=("mse-mtg-phyrexian" "magicseteditor-mtg-base")
source=('http://downloads.sourceforge.net/project/msetemps/Magic%20-%20Recently%20Printed%20Styles.mse-installer'
        'http://downloads.sourceforge.net/project/msetemps/Magic%20-%20Tarkir%20Update.mse-installer')

package_mse-mtg() {
	pkgdesc="Magic: the Gathering base game and symbol fonts for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic.mse-game "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-{blends,default-image,future-common,identity-new,watermarks}.mse-include "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-mana-{large,small{,-grey}}.mse-symbol-font "$pkgdir/usr/share/magicseteditor/data"
}

package_mse-mtg-new()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering Modern templates for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new*.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

package_mse-mtg-m15()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering M15 templates for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-m15*.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2
md5sums=('5ca37f7fb47fb10565b8a2c617d968e8'
         '7bed025a7b878a3af060a9cb47139bb9')
