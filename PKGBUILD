# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=nasa-pod
pkgver=1
pkgrel=4
pkgdesc="Systemd service and timer for fetching Nasa's picture of the day and setting it as wallpaper in Gnome."
license=('MIT')
arch=('x86_64' 'i686')
url="https://github.com/EgidioCaprino/nasa-pod"
depends=('wget' 'gconf')
makedepends=()
source=(nasa-pod.sh nasa-pod.service nasa-pod.timer)
sha256sums=(
    '65e4f3c957682eb43a73afc2ae0d1be475102ac73192ddbb35c849f7a1a742a6'
    '4ff5f1c0c80624d7526cb076014984a52677c9be33f402e288dd0dd293a97538'
    '882b872c26dcc4ba76cdf3ae5641648ddfcebdd19d888540a2182286713e6a6b'
)

package() {
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/lib/systemd/user/"

    cp "$srcdir/nasa-pod.sh" "$pkgdir/opt/"
    cp "$srcdir/nasa-pod.service" "$pkgdir/usr/lib/systemd/user/"
    cp "$srcdir/nasa-pod.timer" "$pkgdir/usr/lib/systemd/user/"
    
    chmod +x "$pkgdir/opt/nasa-pod.sh"
}

