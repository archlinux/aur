# Maintainer: Marcel Röthke <marcel@roethke.info>

pkgname=zfs_snapmount-git
pkgver=r19.9944142
pkgrel=1
pkgdesc="Script for mounting zfs snapshot recursively"
arch=(any)
url="https://github.com/alvistar/zfs_snapmount"
license=('MIT')
depends=()
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://github.com/alvistar/zfs_snapmount.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 zfs_snapmount.sh "${pkgdir}/usr/bin/zfs_snapmount"
}
