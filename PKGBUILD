# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-londrina
pkgver=1.0r19.f7aed96
pkgrel=1
pkgdesc='Handwriting font inspired from the streets of Sao Paulo, Brazil'
arch=(any)
url="https://tipospereira.com/londrina-typeface"
license=('OFL')
source=("git+https://github.com/marcelommp/Londrina-Typeface")
sha256sums=('SKIP')

pkgver() {
	cd "Londrina-Typeface" || return 1
	printf "1.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "Londrina-Typeface" || return 1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" OTF/*.otf
}
