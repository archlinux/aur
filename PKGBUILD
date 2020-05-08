# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=jadx-gui-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="A .desktop file for JADX-GUI, with an icon"
arch=(any)
url="https://github.com/skylot/jadx"
license=('Apache-2.0')
depends=(jadx)
source=(
	# Not using the SVG version because it doesn't render the letters with the correct font :-/
	"https://github.com/skylot/jadx/raw/master/jadx-gui/src/main/resources/logos/jadx-logo.png"
	"jadx-gui.desktop"
)
sha512sums=(
	e951109662a0023be3e7171f1d77d88e4e2f432ec616471f543c03de85a9da6e6fff844d4dd3ce84de0ccb74fe63f6845db2baff2fdb55a4944048ab8136eb2d
	731ec3e08adaf12d04a733363e661d50fd1e11f1e5e87a8ae0ec3de2b3fc855d74360ca579b694cbfab2685dfd1f8ea2eb592816d8c0fd8163073a95d90d578a
)
package() {
	mv jadx-logo.png jadx.png
	install -Dm 644 "${srcdir}"/jadx-gui.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm 644 "${srcdir}"/jadx.png -t "${pkgdir}"/usr/share/pixmaps/
}
