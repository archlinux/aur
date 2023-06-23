# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=com.microsoft.word.deepin
pkgver=2007deepin1
pkgrel=1
pkgdesc="Microsoft Word on Deepin Wine"
arch=(x86_64)
url="https://www.microsoft.com/en/microsoft-365/previous-versions/download-office-2007"
license=('custom')
depends=(
	deepin-wine5
	glib2 at-spi2-core libx11 fontconfig xdg-utils gdk-pixbuf2 pango gtk2 glibc bash cairo freetype2)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/$pkgname/${pkgname}_${pkgver}_i386.deb"
)
sha256sums=('3ea0c26e380f5f31d6cc9f4386784465942de83ce614f2d22a6eb819d5d8d5ce')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
	echo "run /opt/apps/com.microsoft.word.deepin/files/run.sh to launch the app"
}
