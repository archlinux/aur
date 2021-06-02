# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=borna-fonts
pkgver=20011225
pkgrel=4
pkgdesc="Borna Rayaneh Co. Persian B font series."
url="http://www.bornaray.com/"
arch=(any)
license=(unknown)
depends=('fontconfig')
provides=('ttf-borna' "$pkgname")
conflicts=('ttf-borna' "$pkgname")
replaces=('ttf-borna')
source=("$pkgname.zip::http://www.bornaray.com/Content/downloads/bfonts.zip")
sha256sums=('f9d7dcabe3378b82d7d32ae5b4f41b90dc9f72a572604ee59b4ebde54851379a')

prepare() {
	cd BFonts
	for i in $(find . -type f -name "*[A-Z]*"); 
		do mv "$i" "$(echo $i | tr A-Z a-z)"; 
	done
}

package() {
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 BFonts/*.ttf
}

# vim:set ts=4 sw=4:
