# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=jadx-gui-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="A .desktop file for JADX-GUI, with an icon"
arch=(any)
url="https://github.com/skylot/jadx"
license=('Apache-2.0')
depends=(jadx)
source=(
	# Not using the SVG version because it doesn't render the letters with the correct font :-/
	"https://github.com/skylot/jadx/raw/df38a6424f51ad04588be2a6ef017da9af2889e2/jadx-gui/src/main/resources/logos/jadx-logo.png"
	"jadx-gui.desktop"
)
sha512sums=(
	e951109662a0023be3e7171f1d77d88e4e2f432ec616471f543c03de85a9da6e6fff844d4dd3ce84de0ccb74fe63f6845db2baff2fdb55a4944048ab8136eb2d
	05a0df41afb09172ad410a77b2b881f1a50a66bc73f3e26ed6797281d01ae745aad0f80650085f5bab1f2cd40921aad2f623073539a345bf410c298a0cb7b42f
)
package() {
	mv jadx-logo.png jadx.png
	install -Dm 644 "${srcdir}"/jadx-gui.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm 644 "${srcdir}"/jadx.png -t "${pkgdir}"/usr/share/pixmaps/
}
