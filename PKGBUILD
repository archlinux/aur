# Maintainer: George Ioakeimidis <giorgosioak95@gmail.com>
pkgname=pokemon-wallpapers
pkgver=1.0.0
pkgrel=1
pkgdesc="A set of 700 FullHD Pokemon Wallpapers made by Teej/TopHat."
arch=(any)
url="https://github.com/giorgosioak/${pkgname}"
license=('GPLv3')
source=("https://github.com/giorgosioak/pokemon-wallpapers/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('4ec401e81543b54dbf39794b9e6b441d') #autofill using updpkgsums

package() {

	cd "$srcdir/$pkgname-$pkgver/pokemon/"

	# Creating needed directories
	install -dm755 "${pkgdir}/usr/share/backgrounds/pokemon/"

	# Wallpapers
	local wallpaper
	for wallpaper in *; do
		install -m755 "$srcdir/$pkgname-$pkgver/pokemon/${wallpaper}" "$pkgdir/usr/share/backgrounds/pokemon/${wallpaper}"
	done
}