# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.4.2
pkgrel=1
arch=('x86_64' 'i386')
pkgdesc="Cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base' 'desktop-file-utils')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v${pkgver}/eqonomize-${pkgver}-${CARCH}.tar.gz"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v${pkgver}/data/eqonomize.desktop"
		"https://github.com/Eqonomize/Eqonomize/raw/master/data/scalable/eqonomize.svg")
if [[ $CARCH == 'x86_64' ]]; then
	sha256sums=('77751a92af351a717f47e39cb98a67b165d92f07b33b7a336ff6e5c951260331')
elif [[ $CARCH == 'i686' ]]; then
	sha256sums=('a428490058b1bfdf7b8758d325b393e8903a1dce784f1b18608a0cb70b719a3a')
fi

sha256sums+=('3c011e0820f85d5f25eefd7db5257fb11cd7effcc1a9eaea6a6dc12db9c5ad1a' '43efd837dac524aa05515a761880085afe98fef518d82cdb4e9f98a48cf68c2d')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "eqonomize" "$pkgdir/usr/bin/eqonomize"
	chmod +x "$pkgdir/usr/bin/eqonomize"

	mkdir -p "$pkgdir/usr/share/applications"
	cp "eqonomize.desktop" "$pkgdir/usr/share/applications"
	chmod +x "$pkgdir/usr/share/applications/eqonomize.desktop"

	mkdir -p "$pkgdir/usr/share/pixmaps"
	cp "eqonomize.svg" "$pkgdir/usr/share/pixmaps/eqonomize.svg"
}
