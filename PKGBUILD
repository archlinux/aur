# Contributor: Asuka Minato
pkgname=com.microsoft.visio.deepin
pkgver=2007deepin1
pkgrel=1
pkgdesc="Microsoft Visio on Deepin Wine"
arch=(x86_64)
url="https://www.microsoft.com/en/microsoft-365/previous-versions/download-office-2007"
license=('custom')
depends=(
	deepin-wine5
	glib2 at-spi2-core libx11 fontconfig xdg-utils gdk-pixbuf2 pango gtk2 glibc bash cairo freetype2)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/$pkgname/${pkgname}_${pkgver}_i386.deb"
)
sha256sums=('0276aa9060ee113167e5d43cc59fdff7f2c699d04161170a412989f4736374ce')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
	echo "run /opt/apps/com.microsoft.visio.deepin/files/run.sh to launch the app"
}
