# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-graduate-git
_pkgname=Graduate-Variable-Font
pkgver=r45.6cead8a
pkgrel=1
pkgdesc='Variable font in classic college block style'
arch=(any)
url="https://github.com/etunni/$_pkgname"
license=(OFL)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" fonts/variable/*.ttf
}
