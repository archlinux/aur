# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-vimix-git
_gitname=vimix-kde
pkgver=r35.8ecc8db
pkgrel=1
pkgdesc="Vimix theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/vimix-kde"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'vimix-kde')
source=('git+https://github.com/vinceliuice/vimix-kde.git')
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

