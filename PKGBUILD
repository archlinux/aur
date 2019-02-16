# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=mpdmenu-git
_gitname=mpdmenu
pkgver=r18.c52189a
pkgrel=2
pkgdesc="Simple dmenu frontend for MPD"
license=( MIT )
url=https://github.com/arikai/mpdmenu
depends=( 'dmenu' 'python-mpd2' )
optdepends=( 'mpd' )
arch=( any )
makedepends=( git )
conflicts=( mpdmenu )
provides=( mpdmenu  )
source=( 'git://github.com/arikai/mpdmenu.git' )
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/mpdmenu"
   # printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/mpdmenu"
    install -D -m0755 \
        "${srcdir}/mpdmenu/mpdmenu.py" \
        "$pkgdir/usr/bin/mpdmenu"
}


