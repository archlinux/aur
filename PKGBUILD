
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=com.screener-plugin.deepin
pkgver=1.0.0.2
pkgrel=1
pkgdesc="屏幕截图精灵"
arch=(x86_64)
url="https://deepin-wine.i-m.dev/"
license=(custom)
depends=(
"alsa-lib"
"glibc"
"glib2" gdk-pixbuf2 freetype2 libx11 pango xdg-utils at-spi2-core cairo fontconfig gtk2 bash)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.screener-plugin.deepin/com.screener-plugin.deepin_1.0.0.2eepin1_i386.deb")
sha256sums=('a0732a6c456798ddc5c0f4269aff82bcb5f87b382902373266ca9ebcbe622e11')

package() {
	tar -xvpf data.tar.* -C "$pkgdir"
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
}
