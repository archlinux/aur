# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme
_reponame=Adwaita-colors
pkgver=2.2
_commit=a6f658f0c3d659f7b213d91c1a6b46e7cfe405ef # Release tag commit
pkgrel=7
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/Adwaita-colors"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
conflicts=("adwaita-colors-icon-theme-git")
source=("https://github.com/dpejoh/Adwaita-colors/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
	local themedir="$pkgdir/usr/share/icons"
	tar -xzf v$pkgver.tar.gz
	install -d "$themedir"
	cp -r "$_reponame-$pkgver/Adwaita"*      "$themedir"
}
