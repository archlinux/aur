# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_extensionuuid=emoji-selector@maestroschan.fr
pkgname=gnome-shell-extension-emoji-selector-git
pkgver=15.r20.g723430a
pkgrel=1
pkgdesc="Gnome shell emoji picker Extension."
arch=(any)
url="https://github.com/maoschanz/emoji-selector-for-gnome"
license=('GPL3')
depends=('gnome-shell>=3.26')
makedepends=('git')
optdepends=('ttf-joypixels: Emoji as a Service (formerly EmojiOne)'
						'noto-fonts-emoji: Google Noto emoji fonts')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell-extension.install
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_extensionuuid}"
	cp -a "${srcdir}/${pkgname%-git}/${_extensionuuid}"/* \
		"${pkgdir}/usr/share/gnome-shell/extensions/${_extensionuuid}"
}
