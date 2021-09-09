# Maintainer: esrh : email at esrh at netc dot eu
pkgname=mpv-mpvacious
pkgver=0.13.r21.ga9cb73d
pkgrel=2
pkgdesc="Adds mpv keybindings to create Anki cards from movies and TV shows."
arch=('any')
url="https://github.com/Ajatt-Tools/mpvacious"
license=('GPL3')
depends=('mpv')
optdepends=('xclip: clipboard autocopy' 'wl-clipboard: clipboard autocopy on wayland')
source=("mpv-mpvacious::git+https://github.com/Ajatt-Tools/mpvacious")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed "s/-/.r/;s/-/./" | cut -c2-
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 subs2srs.lua "${pkgdir}/etc/mpv/scripts/mpvacious/subs2srs.lua" 
	install -Dm644 osd_styler.lua "${pkgdir}/etc/mpv/scripts/mpvacious/osd_styler.lua" 
	install -Dm644 main.lua "${pkgdir}/etc/mpv/scripts/mpvacious/main.lua" 
}

