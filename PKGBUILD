# Maintainer: Paulo Fino <somepaulo@duck.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-icon-theme
_reponame=MoreWaita
pkgver=47.2
_commit=ae561cdc92bbf7221a08f5f982ab792fea67edeb # tag/v47.2
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

	cp -r "$_reponame/scalable"      "$themedir/scalable"
	cp -r "$_reponame/symbolic"     "$themedir/symbolic"
	cp "$_reponame/index.theme"  "$themedir/index.theme"
}
