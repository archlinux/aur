# Maintainer: Philipp Büttgenbach <git@maipeih7.anonaddy.com>
pkgname=(otf-piazzolla ttf-piazzolla ttf-piazzolla-variable)
pkgbase=piazzolla-font
pkgver=2.005
pkgrel=1
pkgdesc='A font with a compact appearance'
arch=(any)
url="https://piazzolla.huertatipografica.com/"
license=(OFL)
source=("https://github.com/huertatipografica/piazzolla/releases/download/v$pkgver/Piazzolla.zip"
	"https://github.com/huertatipografica/piazzolla/releases/download/v$pkgver/PiazzollaSC.zip")
_b3sums=('eac2934e2be84a26cde480dc028e2c57829ea0084857caae445185d034a831b7'
	'a737937fba4b23d14bdeb059e4fced2bb266e85e3a76727b72c5f90429f3a9e3')
sha256sums=(
	'a45561a595c9511f380548e3f7e35e1a6c5cb79d2c9939803161c5d95d5b0cd9'
	'a72861fbeff4c32ba14f6f02b487f9849cc40963dc02be2ac7f8cc460ca9f01d')

function _pkg_piazzolla {
	pkgdesc+=$1
	for fnt in "Piazzolla" "PiazzollaSC"; do
		install -Dm644 -t "$pkgdir/usr/share/fonts/piazzolla" $fnt/$2/$3/*.$3
	done
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" Piazzolla/OFL.txt
}

package_otf-piazzolla() {
	_pkg_piazzolla ' (static cuts as open type font)' 'static' 'otf'
}

package_ttf-piazzolla() {
	_pkg_piazzolla ' (static cuts as true type font)' 'static' 'ttf'
}

package_ttf-piazzolla-variable() {
	_pkg_piazzolla ' (variable version)' 'variable' 'ttf'
}
