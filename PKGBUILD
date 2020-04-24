# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.4.3
pkgrel=1
arch=('x86_64' 'i386')
pkgdesc="Cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v${pkgver}/eqonomize-${pkgver}-${CARCH}.tar.gz"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v${pkgver}/data/eqonomize.desktop"
		"https://github.com/Eqonomize/Eqonomize/raw/v${pkgver}/data/scalable/eqonomize.svg")
if [[ $CARCH == 'x86_64' ]]; then
	sha256sums=('f9caacd722595b614d333a1b0563983557038ffcc053f84721f35c72ba6444ed')
elif [[ $CARCH == 'i686' ]]; then
	sha256sums=('fcc1e562c6594081edd22a1494e05cd99e1b5ad0298371d52dac68c34c842f0d')
fi

sha256sums+=('3c011e0820f85d5f25eefd7db5257fb11cd7effcc1a9eaea6a6dc12db9c5ad1a' '0c036f8ac76d77f1493fe9984cc36c0b7760274d2cd4b532b48e6c1fa1b9f589')

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
