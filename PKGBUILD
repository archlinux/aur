# Maintainer: Varakh <varakh@varakh.de>

pkgname=spotifyd-bin
pkgver=0.2.2
pkgrel=2
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2018-06-23-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('eb7f06eb4ef2d964902963df4f6bd4a3b208a37f174be76fc505ebb2e2285c5d'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('6f8605074472c43dde7511b6662ebc1976f69761267a499b7c7f9a5bdfc3c8ec'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2018-06-23-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
