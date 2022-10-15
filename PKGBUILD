# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita-git
pkgver=r5.3b52de6
pkgrel=1
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url=https://github.com/somepaulo/MoreWaita
license=(GPL3)
depends=(gnome-shell)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "$pkgdir/usr/share/icons"

	rm -rf "${pkgname%-git}/.git"
	cp -r "${pkgname%-git}" "$pkgdir/usr/share/icons"
}
