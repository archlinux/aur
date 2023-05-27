# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=com.xmly.deepin
pkgver=1.6.0deepin0
pkgrel=1
epoch=
pkgdesc="Ximalaya Client on Deepin Wine"
arch=(x86_64)
url=https://www.ximalaya.com/
license=('custom')
groups=()
depends=(
	deepin-wine5
	lib32-glibc
	lib32-udis86-git
	hicolor-icon-theme
	glib2 at-spi2-core libx11 fontconfig xdg-utils gdk-pixbuf2 pango gtk2 glibc bash cairo freetype2)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/$pkgname/${pkgname}_${pkgver}_i386.deb"
)
noextract=()
sha256sums=('a58ea9151c0d4436560bf71015d6bfffc0eb5eee44d594ed56bae127e968f33e')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
}
