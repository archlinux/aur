# Maintainer: Varakh <varakh@varakh.de>

pkgbase=spotifyd-bin
pkgname=('spotifyd-bin' 'spotifyd-bin-slim')
pkgver=0.2.24
pkgrel=1
conflicts=('spotifyd')
provides=('spotifyd')
depends=('alsa-lib')
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('GPL3')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-slim.tar.gz" "spotifyd.service")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-slim.tar.gz" "spotifyd.service")
source_armv6h=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-armv6-slim.tar.gz" "spotifyd.service")
source_armv7h=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-armhf-slim.tar.gz" "spotifyd.service")
sha256sums_x86_64=('bda3c4be1323f952feaa38936413f99f3c2c18947256bafa78db5c56c25b31b7'
            '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_aarch64=('bda3c4be1323f952feaa38936413f99f3c2c18947256bafa78db5c56c25b31b7'
            '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_armv6h=('bda3c4be1323f952feaa38936413f99f3c2c18947256bafa78db5c56c25b31b7'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_armv7h=('f88215ae7bf7c85a1882b8c833876663e7a1fdd988180fd18454fab70709d852'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')

_package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}

package_spotifyd-bin() {
    pkgdesc="$pkgdesc - slim distribution"
    _package
}

package_spotifyd-bin-slim() {
    pkgdesc="$pkgdesc - slim distribution"
    _package
}
