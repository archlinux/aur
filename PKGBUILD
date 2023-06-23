# Contributor: Asuka Minato
pkgname=com.microsoft.powerpoint.deepin
pkgver=2007deepin1
pkgrel=1
pkgdesc="Microsoft PowerPoint on Deepin Wine"
arch=(x86_64)
url="https://www.microsoft.com/en/microsoft-365/previous-versions/download-office-2007"
license=('custom')
depends=(
	deepin-wine5
	glib2 at-spi2-core libx11 fontconfig xdg-utils gdk-pixbuf2 pango gtk2 glibc bash cairo freetype2)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/$pkgname/${pkgname}_${pkgver}_i386.deb"
)
sha256sums=('71dde84ebc712390a3d6201d381acca643458a39e24e65e81447bd23b3d73715')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
	echo "run /opt/apps/com.microsoft.powerpoint.deepin/files/run.sh to launch the app"
}
