# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=nasa-pod
pkgver=1
pkgrel=1
pkgdesc='Systemd service and timer for fetching Nasa's picture of the day and setting it as wallpaper in Gnome.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/EgidioCaprino/nasa-pod'
depends=('wget' 'gconf')
makedepends=()
source=(nasa-pod.sh nasa-pod.service)
sha256sums=('SKIP')

build() {

}

package() {
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/lib/systemd/user/"

    cp "$srcdir/nasa-pod.sh" "$pkgdir/opt/"
    cp "$srcdir/nasa-pod.service" "$pkgdir/usr/lib/systemd/user/"
    
    chmod +x "$pkgdir/opt/nasa-pod.sh"
    systemctl daemon-reload
}

