# Maintainer: Librewish <librewish at gmail dot com>
pkgname=kvantum-theme-breeze-git
_gitname=Breeze-kvantum
pkgver=r5.30ff5a7
pkgrel=1
pkgdesc="Breeze theme for Kvantum"
arch=('any')
url="https://github.com/Luwx/Breeze-kvantum"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Luwx/Breeze-kvantum.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/usr/share"
	mkdir -p "${pkgdir}/usr/share/Kvantum"
	cp -r Breeze-Kv/Breeze-Kv "$pkgdir/usr/share/Kvantum/"
}

