# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=7.0.0
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://codeberg.org/thatonecalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("nerdfetch.tar.gz::https://codeberg.org/thatonecalculator/NerdFetch/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('12ab1af886d4f12c86cab1dba32a2769527fc7149cafc76613f2500e4471544d')

prepare() {
	tar -xf "nerdfetch.tar.gz"
	cd "nerdfetch"
}

package() {
	install -Dm755 "${srcdir}/nerdfetch/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/nerdfetch/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/nerdfetch/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
