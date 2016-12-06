# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.92
pkgrel=1
pkgdesc="A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="https://www.gnome-look.org/content/show.php/OneStepBack?content=170904"
license=('GPL3')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1479850469/OneStepBack.zip")
sha256sums=('a5d92e09525a0b4dc1cccfa0d9ddd3a1fd0d13b87752a540ab25534a4f655755')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find index.theme gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
