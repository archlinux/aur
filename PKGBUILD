# Maintainer: Amael <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-appimage
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="Eqonomize! is a cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v1.3.0/Eqonomize-1.3.AppImage"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v1.3.0/data/eqonomize.desktop")
noextract=("${source[@]##*/}")
sha256sums=('a9d0682e641ed04db2c099592c53504239e0c14b610f1eb799199bd01356e834'
			'3c011e0820f85d5f25eefd7db5257fb11cd7effcc1a9eaea6a6dc12db9c5ad1a')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "Eqonomize-$pkgver.AppImage" "$pkgdir/usr/bin/eqonomize"
	chmod +x "$pkgdir/usr/bin/eqonomize"

	mkdir -p "$pkgdir/usr/share/applications"
	cp "eqonomize.desktop" "$pkgdir/usr/share/applications"
	chmod +x "$pkgdir/usr/share/applications/eqonomize.desktop"
}
