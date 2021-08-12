# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=xfce-simplicity
pkgname=xfce-simplicity-edition-wallpapers
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Simplicity Edition Wallpapers Themed for XFCE'
arch=(any)
url='https://www.pling.com/p/1307493/'
_url="https://github.com/MMcQueenGNU"
license=('CC-BY-SA')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

md5sums=('c2615ec06bda728e2b3b660463122548')

package() {

	cd "$srcdir/$pkgname-$pkgver/$_pkgname"

	# Creating needed directories
	install -dm755 "${pkgdir}/usr/share/backgrounds/$_pkgname/"

	# Wallpapers
	local wallpaper
	for wallpaper in *; do
		install -m755 "$srcdir/$pkgname-$pkgver/$_pkgname/${wallpaper}" "$pkgdir/usr/share/backgrounds/$_pkgname/${wallpaper}"
	done
}
