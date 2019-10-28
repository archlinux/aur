# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-tilix-git
pkgver=r23.2bf069e
pkgrel=1
pkgdesc="Tempus themes for the Tilix terminal emulator"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('tilix')
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
	install -d "$pkgdir/usr/share/tilix/schemes"
	install -Dm644 *.json "$pkgdir/usr/share/tilix/schemes"
}
