# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=gnome-fine-tune
pkgname=gnome-fine-tune-wallpapers
pkgver=1.0.1
pkgrel=1
pkgdesc='Fine Tune Wallpapers Themed for Gnome'
arch=(any)
url='https://www.pling.com/p/1305245/'
_url="https://github.com/MMcQueenGNU"
license=('CC-BY-SA')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

md5sums=('23be1bf75a8836a297bb367e83aa552c')

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
