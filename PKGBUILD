# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

# This wallpaper collection is complementary to the
# Shimmer Project Xfce themes

pkgname=shimmer-wallpapers-git
_pkgname=Wallpapers
_pkgnamelong="Shimmer-Wallpapers"
pkgver=0.r1
pkgrel=1
pkgdesc="Complementary wallpaper collection for the Shimmer Project Xfce themes"
arch=("any")
url=http://shimmerproject.org
license=(CCPL:by-sa-3.0)
groups=("xfce-themes-shimmer-collection-git")
replaces=("shimmer-wallpapers")
conflicts=("shimmer-wallpapers")
provides=("shimmer-wallpapers" "shimmer-wallpapers-git")
makedepends=("git")
optdepends=("elementary-xfce-icons: matching icon set, -git or stable"
    "xfce-theme-albatross: matching Shimmer Project Xfce theme, -git or stable"
    "xfce-theme-bluebird: matching Shimmer Project Xfce theme, -git or stablr"
    "xfce-theme-greybird: matching Shimmer Project Xfce theme, -git or stable")
source=("${_pkgnamelong}::git://github.com/shimmerproject/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgnamelong}"

	echo 0.r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {

	mkdir -p "${pkgdir}/usr/share/backgrounds/xfce/"

	cp -r "${srcdir}/Shimmer-Wallpapers/Albatross"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
	cp "${srcdir}/Shimmer-Wallpapers/Bluebird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
	cp "${srcdir}/Shimmer-Wallpapers/Greybird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
}
