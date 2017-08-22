# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gnome-shell-extension-emoji-selector-git
pkgver=3.r44.g258fd7e
pkgrel=1
pkgdesc="Gnome shell emoji picker Extension."
arch=(any)
url="https://github.com/Maestroschan/emoji-selector-for-gnome"
license=('GPL3')
depends=('gnome-shell>=3.18')
makedepends=('git')
optdepends=('cairo-coloredemoji: (Recommended) display color emoji in all GTK+ apps.'
			'emojione-fonts: Colored emoji fonts from EmojiOne project.'
			'noto-fonts-emoji: Google Noto emoji fonts.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell.install
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -d "$pkgdir/usr/share/gnome-shell/extensions/emoji-selector@maestroschan.fr"
	cp -a "$srcdir/${pkgname%-git}"/* \
	"$pkgdir/usr/share/gnome-shell/extensions/emoji-selector@maestroschan.fr"
}
