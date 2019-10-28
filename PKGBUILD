# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-xfce4-terminal-git
pkgver=r26.04b04e2
pkgrel=1
pkgdesc="Tempus themes for Xfce4 Terminal"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('xfce4-terminal')
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
	install -d "$pkgdir/usr/share/xfce4/terminal/colorschemes"
	install -Dm644 *.theme "$pkgdir/usr/share/xfce4/terminal/colorschemes"
}
