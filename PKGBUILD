# Maintainer: Librewish <librewish at gmail dot com>
pkgname=kvantum-theme-fluent-git
_gitname=Fluent-kvantum
pkgver=r17.890a450
pkgrel=1
pkgdesc="fluent a windows 10 like theme for Kvantum"
arch=('any')
url="https://github.com/Luwx/Fluent-kvantum"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Luwx/Fluent-kvantum.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/usr/share"
	mkdir -p "${pkgdir}/usr/share/Kvantum"
	cp -r Fluent-Light "$pkgdir/usr/share/Kvantum/"
	cp -r Fluent-Dark "$pkgdir/usr/share/Kvantum/"
}

