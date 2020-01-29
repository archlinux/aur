# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-konsole-git
pkgver=r15.7f154ba
pkgrel=1
pkgdesc="Tempus themes for Konsole"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('konsole')
makedepends=('git')
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
	install -d "$pkgdir/usr/share/konsole"
	install -Dm644 *.colorscheme "$pkgdir/usr/share/konsole"
}
