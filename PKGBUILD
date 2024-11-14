# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme
_reponame=Adwaita-colors
pkgver=2.2
_commit=a6f658f0c3d659f7b213d91c1a6b46e7cfe405ef # tag/v2.2
pkgrel=3
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/$_reponame"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
conflicts=("${pkgname%+git}")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

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
