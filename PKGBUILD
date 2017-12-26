# Maintainer: Andrea Pascal <andrea@anodium.net>
pkgname=bulk-git
pkgver="r18.28dc51f"
pkgrel=1
pkgdesc="Executes a command across multiple subdirectories."
arch=('any')
url="https://github.com/shannonmoeller/bulk"
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git://github.com/shannonmoeller/bulk.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bulk"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/bulk"

	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/bulk/bulk.sh" "$pkgdir/usr/bin/bulk"
}
