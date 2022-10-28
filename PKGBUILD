# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-git
_reponame=MoreWaita
pkgver=r60.cfc2b56
pkgrel=1
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url="https://github.com/somepaulo/$_reponame"
license=(GPL3)
depends=(gnome-shell)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "$pkgdir/usr/share/icons"

	rm -rf "$_reponame/.git"
	cp -r "$_reponame" "$pkgdir/usr/share/icons"
}
