# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.91
pkgrel=1
pkgdesc="A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="https://www.gnome-look.org/content/show.php/OneStepBack?content=170904"
license=('GPL3')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1472928821/1472928821-OneStepBack.zip")
sha256sums=('c13def5dc50df72ea581cf726e2ee93c5a65a19c80153c4e128b8aa11e1713fb')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find index.theme gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
