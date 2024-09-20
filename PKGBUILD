# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-git
_reponame=MoreWaita
pkgver=45.r88.gcc79d82
pkgrel=1
epoch=1
pkgdesc='A companion icon theme for Adwaita'
arch=(any)
url="https://github.com/MoreWaita-Dev/$_reponame"
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
