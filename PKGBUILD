# Maintainer: Varakh <varakh@varakh.de>

pkgname=('spotifyd-bin-full')
pkgver=0.2.23
pkgrel=1
conflicts=('spotifyd')
provides=('spotifyd')
depends=('libpulse' 'dbus')
arch=('x86_64' 'aarch64')
license=('GPL3')
pkgdesc="A spotify playing daemon - full distribution"
url="https://github.com/Spotifyd/spotifyd"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-full.tar.gz" "spotifyd.service")
sha256sums=('9fd18602a26991a221002bb547a4d7b721b22b8bec808add492c683ef62ef242'
            '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
