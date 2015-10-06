# Maintainer: spider-mario <spidermario@free.fr>
pkgname=cinnxp
pkgver=0.1
pkgrel=1
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/498"
license=('unknown')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=(cinnxp.zip::http://cinnamon-spices.linuxmint.com/uploads/themes/KI23-LR3V-1MH4.zip)
sha512sums=('cc9c96fb7f030afe2bf0585fd45eaebaa175460c19cda2e2a9e039c35fef00847e2ca386bc82bb6e11b184291b2c1cfd7e82a7b9fe6629de6384aed1cf52985c')

prepare() {
	rm -fr CinnXP
	mv .CinnXP_pkg/ CinnXP
}

package() {
	cd CinnXP

	install -d "$pkgdir"/usr/share/themes/CinnXP
	cp -a index.theme cinnamon gtk-2.0 gtk-3.0 metacity-1 "$pkgdir"/usr/share/themes/CinnXP/

	install -d "$pkgdir"/usr/share/icons/CinnXP
	cp -a cursor.theme cursors "$pkgdir"/usr/share/icons/CinnXP/
}
