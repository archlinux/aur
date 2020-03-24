# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-matcha-git
_gitname=Matcha-kde
pkgver=r9.283b5b1
pkgrel=1
pkgdesc="Matcha theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/Matcha-kde"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "$_gitname")
_commit='283b5b18f0967ab640cfd2633c03308cd4f2b0cb'
source=("git+https://github.com/vinceliuice/Matcha-kde.git#commit=$_commit")
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

