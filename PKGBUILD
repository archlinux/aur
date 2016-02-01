# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.6
pkgrel=1
pkgdesc="OneStepBack is a Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="http://gnome-look.org/content/show.php/OneStepBack?content=170904"
license=('GPL3')
source=("$pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/170904-OneStepBack.zip")
sha256sums=('2b7eb8c9bd8759b7c1ade7237a7ad374d9c8ddaab0be9916443ffc189f2ba5dc')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
