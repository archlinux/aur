# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=plex-media-player-standalone-service
pkgver=1.0
pkgrel=2
pkgdesc="Systemd service and user to run PMP in stand-alone mode"
arch=('x86_64' 'i686')
url="https://github.com/hv15/plex-media-player-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'plex-media-player' 'polkit')
install="${pkgname}.install"
source=("https://github.com/hv15/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/hv15/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
sha256sums=('a231685b9eed6ccfb0eefcf40b89b823ff8d33954c4daa2d68ed386ac73e172b'
            'SKIP')
validgpgkeys=('0x9062A1BF982A2B64')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/plexmediaplayer.service" \
		"$pkgdir/usr/lib/systemd/system/plexmediaplayer.service"
	install -dm 700 "$pkgdir"/var/lib/plexmediaplayer
	chown 1420:1420 "$pkgdir"/var/lib/plexmediaplayer
}
