# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-genome-git
_pkgname=genome
pkgver=r4.e991e65
pkgrel=2
pkgdesc='Thin sans-serif display font by Alfredo Marco Pradil'
arch=(any)
url="https://github.com/marcologous/$_pkgname"
license=(OFL)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL-FAQ.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
