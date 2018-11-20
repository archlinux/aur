# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=gtk-theme-onestepback
_thname=OneStepBack
pkgver=0.991
pkgrel=1
pkgdesc="A Gnome 2 and 3 theme with some colors and embossed widgets inspired by the good old NextStep look."
arch=('any')
url="http://www.vide.memoire.free.fr/perso/OneStepBack"
license=('GPL3')
source=("$pkgname-$pkgver.zip::http://www.vide.memoire.free.fr/perso/$_thname/$_thname-v$pkgver.zip")
sha256sums=('15bee057ab014fe2b6a1864b0fea78bf5107818ce6b23f344e2a9bb5fe63cfc9')
sha512sums=('42f98686295d17a5d0a7ea256667a1f4b8085d3975dcb9bd031bf4d878b7048ad87bb9df1513ab7d7be7906957f5bc5122beccc5ce9aa28ffcbe76677fb72bb5')

package() {
	cd "$srcdir/$_thname"
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	find index.theme gtk-* img -type f -print0 | \
		xargs -0 -I{} -n1 install -D -m644 "{}" "$pkgdir"/usr/share/themes/"$_thname"/"{}"
}
