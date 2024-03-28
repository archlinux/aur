# Maintainer: revsuine <paradoor at protonmail dot com>
_pkgname=wayneko
pkgname=$_pkgname-git
pkgver=r27.a0a22b7
pkgrel=1
pkgdesc="Display an animated neko cat on the bottom of a Wayland output."
arch=("x86_64")
url="https://git.sr.ht/~leon_plickat/$_pkgname"
license=('GPL-3.0-or-later')
depends=("wayland"
         "wlroots")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" MANDIR="/usr/share/man" BASHCOMPDIR="/usr/share/bash-completion" install
}
