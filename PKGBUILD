# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
pkgname="nerdfetch"
pkgver=8.5.1
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/thatonecalculator/NerdFetch"
license=('MIT')
depends=()
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thatonecalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('5c9d3ef573050188f3efc6b903b8ededbfd0e61c7342a4ea327c2c8c5434b84e')
provides=('nerdfetch')
conflicts=('nerdfetch-git')

sourcedir="NerdFetch-${pkgver}"

package() {
	install -Dm755 "${srcdir}/${sourcedir}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/${sourcedir}/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/${sourcedir}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"
}
