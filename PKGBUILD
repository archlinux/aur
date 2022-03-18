# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=kak-case-git
pkgver=r11.6f15118
pkgrel=1
pkgdesc='Case convention conversion for Kakoune'
arch=(any)
url="https://gitlab.com/FlyingWombat/case.kak"
license=(custom)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/case.kak"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/case.kak"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/case.kak
}

