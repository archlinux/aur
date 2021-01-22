# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: librewish
pkgname=whitesur-kvantum-theme-git
_gitname=WhiteSur-kde
pkgver=r33.a7f777c
pkgrel=1
pkgdesc="WhiteSur theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-kde"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'whitesur-kde-theme-git')
source=('git+https://github.com/vinceliuice/WhiteSur-kde.git')
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
