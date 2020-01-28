# Maintainer: Varakh <varakh@varakh.de>

pkgname=('spotifyd-bin-full')
pkgver=0.2.24
pkgrel=1
conflicts=('spotifyd')
provides=('spotifyd')
depends=('libpulse' 'dbus')
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL3')
pkgdesc="A spotify playing daemon - full distribution"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-full.tar.gz" "spotifyd.service")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-full.tar.gz" "spotifyd.service")
source_armv7h=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-armhf-full.tar.gz" "spotifyd.service")
sha256sums_x86_64=('a3d01b7d74e49fa5c67946b9648f5b9c44de8290196b1858667503d8d53aa9e5'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_aarch64=('a3d01b7d74e49fa5c67946b9648f5b9c44de8290196b1858667503d8d53aa9e5'
                    '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_armv7h=('e5668c22dd27f29fe3c4e7d20de507dc6139ac96a6b699900175af31ea88248b'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
