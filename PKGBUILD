# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=morewaita-icon-theme
_reponame=MoreWaita
pkgver=48.3
_commit=a79e8977c70052e6f6089be7d37b91f74b8e5ed3 # full commit ID
pkgrel=1
pkgdesc="An expanded Adwaita-styled companion icon theme with extra icons for popular apps to complement Gnome Shell's original icons. AUR package maintained by upstream developer."
arch=(any)
url="https://github.com/somepaulo/MoreWaita"
license=(GPL3)
depends=(adwaita-icon-theme)
makedepends=(git)
conflicts=("morewaita-icon-theme-git" "morewaita" "morewaita-git")
replaces=("morewaita")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	local themedir="$pkgdir/usr/share/icons/MoreWaita"
	install -d "$themedir"

	find "$_reponame" -name 'meson.build' -type f | xargs rm
	cp -r "$_reponame/scalable" "$themedir/scalable"
	cp -r "$_reponame/symbolic" "$themedir/symbolic"
	cp "$_reponame/index.theme" "$themedir/index.theme"
	cp "$_reponame/LICENSE" "$themedir/LICENSE"
}
