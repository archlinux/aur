# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-kitty-git
pkgver=r8.478b240
pkgrel=1
pkgdesc="Tempus Themes for the Kitty terminal emulator"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('kitty')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/etc/kitty/tempus-themes"
	install -Dm644 *.conf "$pkgdir/etc/kitty/tempus-themes"
}
