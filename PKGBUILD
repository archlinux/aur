# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-impallari-caveat-git
_pkgname=caveat
pkgver=r237.6d65a09
pkgrel=2
pkgdesc='Handwriting font by Pablo Impallari'
arch=(any)
url="https://github.com/googlefonts/$_pkgname"
license=(OFL)
groups=(impallari-fonts)
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/fonts/OTF" fonts/OTF/*.otf
}
