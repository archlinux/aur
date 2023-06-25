# Contributor: Asuka Minato
pkgname=cn.com.dywt.epl.deepin
pkgver=5.92
pkgrel=1
pkgdesc="Easy Programming Language on Deepin Wine"
arch=(x86_64)
source=("$pkgname-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/cn.com.dywt.epl.deepin/cn.com.dywt.epl.deepin_5.92deepin1_i386.deb"
)
sha256sums=('ad22e30a619410dca09f29d05b8b6bc4ae9dac10031cb012967c3e6350f00825')
url="https://deepin-wine.i-m.dev"
license=('private')
depends=(deepin-wine5
	glib2
	hicolor-icon-theme
	glibc freetype2 xdg-utils libx11 gtk2 fontconfig pango bash gdk-pixbuf2 cairo at-spi2-core)

package() {
	bsdtar -xvpf data.tar.* -C $pkgdir
	install -d "$pkgdir"/usr/share/icons
	find "$pkgdir" -name "*.desktop" -exec install -Dm644 {} -t "$pkgdir"/usr/share/applications/ \;
	find "$pkgdir" -name hicolor -type d -exec cp -av {} "$pkgdir"/usr/share/icons/ \;
}
