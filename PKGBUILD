# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>
# Contributor: eshrh <esrh at gatech dot edu>
pkgname=mpv-mpvacious
pkgver=0.17.r26.g1290f2d
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
