# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.8
pkgrel=1
pkgdesc="A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="http://gnome-look.org/content/show.php/OneStepBack?content=170904"
license=('GPL3')
source=("$pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/170904-OneStepBack.zip")
sha256sums=('77010afb594ec60fe3669784883e14aaaec5f6c7c3b768f6f131a0b211fecd9a')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find index.theme gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
