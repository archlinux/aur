# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=nasa-pod
pkgver=1
pkgrel=3
pkgdesc="Systemd service and timer for fetching Nasa's picture of the day and setting it as wallpaper in Gnome."
license=('MIT')
arch=('x86_64' 'i686')
url="https://github.com/EgidioCaprino/nasa-pod"
depends=('wget' 'gconf')
makedepends=()
source=(nasa-pod.sh nasa-pod.service)
sha256sums=(
    'bd868dd708b849ffd4a7156e14390a9cd6067197a257d47139170557b6dc670d'
    '4ff5f1c0c80624d7526cb076014984a52677c9be33f402e288dd0dd293a97538'
)

package() {
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/lib/systemd/user/"

    cp "$srcdir/nasa-pod.sh" "$pkgdir/opt/"
    cp "$srcdir/nasa-pod.service" "$pkgdir/usr/lib/systemd/user/"
    
    chmod +x "$pkgdir/opt/nasa-pod.sh"
}

