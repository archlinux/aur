# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-matcha-git
_gitname=Matcha-kde
pkgver=r11.a3b247b
pkgrel=1
pkgdesc="Matcha theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/Matcha-kde"
license=('GPL3')
depends=('kvantum')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'matcha-kde')
source=('git+https://github.com/vinceliuice/Matcha-kde.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/usr/share"
	cp -r Kvantum "$pkgdir/usr/share"
}
