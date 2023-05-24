# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=com.microsoft.word.deepin
pkgver=2007deepin1
pkgrel=1
epoch=
pkgdesc="Microsoft Word on Deepin Wine"
arch=(x86_64)
url="https://www.microsoft.com/en/microsoft-365/previous-versions/download-office-2007"
license=('custom')
groups=()
depends=(
	deepin-wine5
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
sha256sums=('3ea0c26e380f5f31d6cc9f4386784465942de83ce614f2d22a6eb819d5d8d5ce')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
	echo "run /opt/apps/com.microsoft.word.deepin/files/run.sh to launch the app"
}
