# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
pkgname="nerdfetch"
pkgver=8.5.3
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/thatonecalculator/NerdFetch"
license=('MIT')
depends=()
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thatonecalculator/NerdFetch/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('5ff5ca8abb4c33dfb603aa9ef58cf1b577f4d8f1abe07edf35a767deefb35605')
provides=('nerdfetch')
conflicts=('nerdfetch-git')

sourcedir="NerdFetch-${pkgver}"

package() {
	install -Dm755 "${srcdir}/${sourcedir}/nerdfetch" "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "${srcdir}/${sourcedir}/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "${srcdir}/${sourcedir}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"
}
