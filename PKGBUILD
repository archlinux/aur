# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-git
_reponame=MoreWaita
pkgver=44.1.r54.g79fd860
pkgrel=1
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url="https://github.com/somepaulo/$_reponame"
license=(GPL3)
depends=(adwaita-icon-theme)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local themedir="$pkgdir/usr/share/icons/MoreWaita"
	install -d "$themedir"

	cp -r "$_reponame/apps"      "$themedir/apps"
	cp -r "$_reponame/mimes"     "$themedir/mimes"
	cp -r "$_reponame/panel"     "$themedir/panel"
	cp -r "$_reponame/places"    "$themedir/places"
	cp -P "$_reponame/apps@2x"   "$themedir/apps@2x"
	cp -P "$_reponame/mimes@2x"  "$themedir/mimes@2x"
	cp -P "$_reponame/panel@2x"  "$themedir/panel@2x"
	cp -P "$_reponame/places@2x" "$themedir/places@2x"
	cp "$_reponame/index.theme"  "$themedir/index.theme"
}
