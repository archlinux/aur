# Maintainer: esrh : email at esrh at netc dot eu
pkgname=mpv-mpvacious
pkgver=0.16.r15.g146c890
pkgrel=1
pkgdesc="Adds mpv keybindings to create Anki cards from movies and TV shows."
arch=('any')
url="https://github.com/Ajatt-Tools/mpvacious"
license=('GPL3')
depends=('mpv')
makedepends=('git')
optdepends=('xclip: clipboard autocopy' 'wl-clipboard: clipboard autocopy on wayland')
source=("mpv-mpvacious::git+https://github.com/Ajatt-Tools/mpvacious")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed "s/-/.r/;s/-/./" | cut -c2-
}

package() {
	cd "$srcdir/$pkgname"
    for file in ./*
    do
        install -Dm644 "$file" "${pkgdir}/etc/mpv/scripts/mpvacious/${file}"
    done
}

