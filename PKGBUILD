# Maintainer: kjuq <kjuque plus aur at gmail dot com>

pkgname=osc52
pkgver=r3479.g52e00f2b9
pkgrel=1
pkgdesc="Copy string through osc52"
arch=('any')
url="https://chromium.googlesource.com/apps/libapps/"
license=('BSD-3-Clause')
makedepends=('git')
source=("$pkgname::git+https://chromium.googlesource.com/apps/libapps.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 "hterm/etc/osc52.sh" "$pkgdir/usr/bin/osc52"
}
