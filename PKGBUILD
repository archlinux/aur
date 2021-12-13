# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=genmake-templates-git
pkgver=r2.0f13b05
pkgrel=1
pkgdesc="Makefile templates for genmake"
arch=('any')
url="https://gitee.com/duapple/makefile"
license=('unknown')
depends=('genmake')
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
	install -Dm644 *.conf -t "$pkgdir/usr/share/genmake/templates/"
}
