# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: Phantasm <phantasm@centrum.cz>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-matcha-full-git
pkgver=r31.23a6178
pkgrel=1
pkgdesc="All matcha theme for Kvantum"
arch=('any')
url="https://github.com/R0CKH0PP3R/kvantum/tree/main/Matcha-azul-dark"
license=('GPL3')
depends=('kvantum-theme-matcha')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'matcha-kde')
source=('git+https://github.com/R0CKH0PP3R/kvantum.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/kvantum"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/kvantum"
	install -d "$pkgdir/usr/share/Kvantum"
	cp -r Matcha-azul-dark "$pkgdir/usr/share/Kvantum"
}
