# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.9
pkgrel=1
pkgdesc="A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="http://gnome-look.org/content/show.php/OneStepBack?content=170904"
license=('GPL3')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1470912851/OneStepBack.zip")
sha256sums=('603fc630bab5aba4db2a6eb846239db331657c8d3fbfc5827e0ff94d26240698')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find index.theme gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
