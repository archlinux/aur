# Maintainer: esrh : email at esrh at netc dot eu
pkgname=mpv-mpvacious
pkgver=0.12.r11.gcaff0ab
pkgrel=3
pkgdesc="MPV script to add keybindings to create Anki cards from movies and TV shows."
arch=('any')
url="https://github.com/Ajatt-Tools/mpvacious"
license=('GPL3')
depends=('mpv')
optdepends=('xclip: clipboard autocopy')
source=("mpv-mpvacious::git+https://github.com/Ajatt-Tools/mpvacious")
md5sums=('SKIP')
install="mpvacious.install"


pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed "s/-/.r/;s/-/./" | cut -c2-
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 subs2srs.lua "${pkgdir}/etc/mpv/scripts/subs2srs.lua" 
	install -Dm644 "$srcdir/$pkgname/.github/RELEASE/subs2srs.conf" "${pkgdir}/etc/mpv/script-opts/subs2srs.conf"
}

