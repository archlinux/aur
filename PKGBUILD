# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=com.ancientspider.deepin
pkgver=1.0.0
pkgrel=1
pkgdesc="蜘蛛纸牌"
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=(deepin-wine5
	glib2
	hicolor-icon-theme
	glibc freetype2 xdg-utils libx11 gtk2 fontconfig pango bash gdk-pixbuf2 cairo at-spi2-core)
provides=()
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.ancientspider.deepin/com.ancientspider.deepin_1.0.0deepin4_i386.deb"
)
noextract=()
sha256sums=('d92c5032e1a18108a19d661bd61dff619d27142d2464dbd480aa4f6d1d1433bc')
validpgpkeys=()

package() {
	bsdtar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
}
