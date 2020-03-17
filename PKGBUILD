# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Tomáš Vyčítal <tom.vycital@gmail.com>
pkgname=vimix-icon-theme-git
pkgver=2020.02.24.r9.g61901df5
pkgrel=1
pkgdesc="A Material Design icon theme based on Paper Icon Theme"
arch=('any')
url="https://github.com/vinceliuice/vimix-icon-theme"
license=('CC BY-SA 4.0')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("git+https://github.com/vinceliuice/vimix-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -dm755 "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"

	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
