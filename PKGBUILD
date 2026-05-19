# Maintainer: Elk Cloner <dev [at] elkcl [dot] ru>

pkgname=yukigram-bin
pkgver=6.8.2.2_pre.4
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
sha256sums=('0bfa33c5aa88a5a31f44e911bc1bccff829d9f3ea7c3ef221f01ff7d95d01a56')

package() {
	install -dm755 "$pkgdir/usr"

	cp -r "$srcdir/bin" "$pkgdir/usr"
	cp -r "$srcdir/share" "$pkgdir/usr"
}
