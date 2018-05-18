# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-emoji-selector-git
pkgver=11.r30.g0d6ec2c
pkgrel=1
pkgdesc="Gnome shell emoji picker Extension."
arch=(any)
url="https://github.com/Maestroschan/emoji-selector-for-gnome"
license=('GPL3')
depends=('gnome-shell>=3.18')
makedepends=('git')
optdepends=('ttf-emojione: Colored emoji fonts from EmojiOne project. (Recommended)'
            'noto-fonts-emoji: Google Noto emoji fonts.')
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
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/emoji-selector@maestroschan.fr"
	cp -a "${srcdir}/${pkgname%-git}"/* \
	"${pkgdir}/usr/share/gnome-shell/extensions/emoji-selector@maestroschan.fr"
}
# vim:set ts=2 sw=2 et:
