# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme-git
_reponame=Adwaita-colors
pkgver=2.2.r0.a6f658f
pkgrel=2
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/$_reponame"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local themedir="$pkgdir/usr/share/icons"
	install -d "$themedir"
#	if pacman -Qsq '^morewaita$' &> /dev/null; then
#		echo "yes"
#	else
#		echo "no"
#	fi
	cp -r "$_reponame/Adwaita-*"      "$themedir"
}
