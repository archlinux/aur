# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=genmake-templates-git
pkgver=r5.8ae831b
pkgrel=1
pkgdesc="Makefile templates for genmake"
arch=('any')
url="https://gitee.com/duapple/makefile"
license=('unknown')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 * -t "$pkgdir/usr/local/genmake/config/makefile"
}
