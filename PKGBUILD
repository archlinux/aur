# Maintainer: Gadzhi Kharkharov (kkga) <x@kkga.me>
pkgname=cork.kak-git
pkgver=r23.e496568
pkgrel=1
pkgdesc="A fast git-based plugin manager for Kakoune"
arch=("x86_64")
url="https://github.com/topisani/cork.kak"
license=("UNLICENSE")
depends=("bash")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm775 "$srcdir/${pkgname%-git}/cork.sh" "$pkgdir/usr/bin/cork"
	install -Dm644 "$srcdir/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
