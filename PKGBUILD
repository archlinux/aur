# Maintainer: rany <rany@disroot.org>
pkgname=glowing-bear-electron
pkgver=0.9.0
pkgrel=2
pkgdesc="A web client for Weechat (Electron version)"
arch=(any)
url="https://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron glowing-bear-web)
makedepends=()
source=("glowing-bear.desktop"
	"glowing-bear.sh")
sha256sums=("8e8f5c38849a8e76e0f217c38c24b5b6b297b7c644ea3513ea80a5ac39787424"
	"edcfb232718f4fd54e2bd3b4cc00b6c8de6e8189feab2ec16fb64464833a09b3")

package() {
	# Register the binary as glowing-bear
	install -Dm755 "${srcdir}/glowing-bear.sh" "${pkgdir}/usr/bin/glowing-bear"
	
	# Add the scalable icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	ln -sf /usr/lib/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/glowing-bear.svg"
	
	# Add the 128x128 icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	ln -sf /usr/lib/glowing-bear/assets/img/glowing_bear_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/glowing-bear.png"

	# Add the .desktop file
	install -Dm644 "$srcdir/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
}
