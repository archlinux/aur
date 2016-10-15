# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=nasa-pod
pkgver=1
pkgrel=2
pkgdesc="Systemd service and timer for fetching Nasa's picture of the day and setting it as wallpaper in Gnome."
license=('MIT')
arch=('x86_64' 'i686')
url="https://github.com/EgidioCaprino/nasa-pod"
depends=('wget' 'gconf')
makedepends=()
source=(nasa-pod.sh nasa-pod.service)
sha256sums=(
    '65e4f3c957682eb43a73afc2ae0d1be475102ac73192ddbb35c849f7a1a742a6'
    'be6c8ff8055c38d84523077c892435ac19866390200c0047eb5119e9d15f630e'
)

package() {
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/lib/systemd/user/"

    cp "$srcdir/nasa-pod.sh" "$pkgdir/opt/"
    cp "$srcdir/nasa-pod.service" "$pkgdir/usr/lib/systemd/user/"
    
    chmod +x "$pkgdir/opt/nasa-pod.sh"
}

