# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-circle-icon-theme-git
pkgver=r3.f7ca1fd
pkgrel=1
pkgdesc="A flat colorful design icon theme"
arch=('any')
url="https://github.com/vinceliuice/Tela-circle-icon-theme"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Tela-circle-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -dm755 "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"
}
