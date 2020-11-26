# Maintainer: John Smith <knobpersonal@gmail.com>
pkgname='menu-bookmark-git'
pkgver=r27.117bd15
pkgrel=1
pkgdesc="A website bookmark manager using the menu backend (git version)."
arch=('any')
url="https://gitlab.com/KNIX3/bookmarkmenu"
license=('GPL')
depends=('menu' 'tree' 'dmenu')
makedepends=('git')
provides=('menu-bookmark')
source=("$pkgname::git+https://gitlab.com/KNIX3/bookmarkmenu.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	install -Dm755 ./bookmarkmenu "$pkgdir/usr/bin/bookmarkmenu"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
