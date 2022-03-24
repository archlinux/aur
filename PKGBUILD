# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=kak-cd-git
pkgver=r10.0f775fe
pkgrel=1
pkgdesc='Commands to change or print working directory'
arch=(any)
url="https://github.com/Delapouite/kakoune-cd"
license=(MIT)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/kakoune-cd"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/kakoune-cd"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" cd.kak
}
