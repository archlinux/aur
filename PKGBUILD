# Maintainer: Elk Cloner <dev [at] elkcl [dot] ru>

pkgname=yukigram-bin
pkgver=6.8.2.2
pkgrel=1
pkgdesc="Telegram Desktop, minus the bullshit, plus the features"
arch=(x86_64)
url="https://github.com/yukigram/yukigram"
license=('GPL-3.0-or-later WITH sqlitestudio-OpenSSL-exception')
depends=(glibc fontconfig glib2 hicolor-icon-theme libx11 freetype2)
optdepends=(
	'geoclue: geoinformation support'
	'crow-translate: translation provider'
	'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
	'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
	'xdg-desktop-portal: desktop integration'
)
conflicts=(telegram-desktop)
provides=(telegram-desktop)

source=($url/releases/download/v${pkgver/_/-}/binary-${CARCH}.tar.gz)
sha256sums=('021ccebaa5bfe586e72253696f8f4b07befed7fbdc76886950d7509b5acb3961')

package() {
	install -dm755 "$pkgdir/usr"
	cp -a "$srcdir/bin" "$pkgdir/usr"
	cp -a "$srcdir/share" "$pkgdir/usr"
}
