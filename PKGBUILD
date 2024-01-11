# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=7.1.0
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://codeberg.org/thatonecalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("nerdfetch.tar.gz::https://github.com/thatonecalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('37c3906ac10bd51bfee9e19655a0cc37e7ba197ace629615bf91f245b42eb025')

sourcedir="NerdFetch-${pkgver}"

prepare() {
	tar -xf "nerdfetch.tar.gz"
}

package() {
	install -Dm755 "${srcdir}/${sourcedir}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/${sourcedir}/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/${sourcedir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
