# Maintainer: Paulo Fino <somepaulo@duck.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-icon-theme
pkgver=47.0
_commit=1106883adbde1771d50434990cd7b65601ae7d23 # tag/v47
pkgrel=1
pkgdesc="An expanded Adwaita-styled companion icon theme with extra icons for popular apps to complement Gnome Shell's original icons. AUR package maintained by upstream developer."
arch=(any)
url="https://github.com/somepaulo/MoreWaita"
license=(GPL3)
depends=(adwaita-icon-theme)
makedepends=(git)
conflicts=("${pkgname%+git}" "morewaita" "morewaita-git")
replaces=("morewaita")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	local themedir="$pkgdir/usr/share/icons/MoreWaita"
	install -d "$themedir"

	cp -r "$_reponame/scalable"      "$themedir/scalable"
	cp -r "$_reponame/symbolic"     "$themedir/symbolic"
	cp "$_reponame/index.theme"  "$themedir/index.theme"
}
