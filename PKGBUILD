# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=com.microsoft.visio.deepin
pkgver=2007deepin1
pkgrel=1
epoch=
pkgdesc="Microsoft Visio on Deepin Wine"
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
sha256sums=('0276aa9060ee113167e5d43cc59fdff7f2c699d04161170a412989f4736374ce')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
	echo "run /opt/apps/com.microsoft.visio.deepin/files/run.sh to launch the app"
}
