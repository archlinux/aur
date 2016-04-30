# Maintainer: spider-mario <spidermario@free.fr>
pkgname=cinnxp-royale
pkgver=1.0.2
pkgrel=1
pkgdesc="XP-like theme for Cinnamon (Royale variant)"
arch=('any')
url="https://cinnamon-spices.linuxmint.com/themes/view/561"
license=('unknown')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=("cinnxp-$pkgver.zip"::https://cinnamon-spices.linuxmint.com/uploads/themes/ZU6D-AP03-Q7OY.zip)
sha512sums=('68f8bb99dde4a3d20352d0045ded626de809eea035511b2429a43db6c712be07c9942a7403a28b7ff0d8221040e7f0bfeb7163fcad4ef298146fcfe6fa20bfab')

package() {
	cd pkg
	cp -aR usr "$pkgdir"/usr

	cd "$pkgdir"/usr/share
	for subdir in *; do
		mv "$subdir"/CinnXP{,-Royale}
	done
	perl -pe 's/(?<=CinnXP)/-Royale/' -i icons/CinnXP-Royale/cursor.theme
}
