# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=titillium-fonts
pkgver=2.0
pkgrel=1
pkgdesc="Sans serif type family designed inside Campi Visivi’s Type Design course"
url="http://www.campivisivi.net/titillium/"
arch=(any)
license=(custom)
source=("https://src.fedoraproject.org/repo/extras/campivisivi-titillium-fonts/Titillium_roman_upright_italic_2_0_OT.zip/258e06fe34c35320321f0458e6625bba/Titillium_roman_upright_italic_2_0_OT.zip")
sha512sums=('ee10b5551ac58f4b61d5b88e9992fc86e342b8e79e23caec42ffc7d6c94f676a82fff6ee343ee0b372d7d7b2d6471eae047b31dc21a402d7570d432877c20533')

package() {
	cd "Titillium_roman_upright_italic_${pkgver//./_}_OT/"
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.otf
	install -Dm644 "OFL-titillium.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
