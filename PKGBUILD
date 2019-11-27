# Maintainer: Varakh <varakh@varakh.de>

pkgname=('spotifyd-bin-full')
pkgver=0.2.20
pkgrel=1
conflicts=('spotifyd')
provides=('spotifyd')
depends=('libpulse' 'dbus')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
pkgdesc="A spotify playing daemon - full distribution"
url="https://github.com/Spotifyd/spotifyd"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-full.tar.gz" "spotifyd.service")
sha256sums=('e53a984a1280424e4679cf531b3eb896e1243f5cd3042df602ffe0ffcc3f1f4c'
            '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
