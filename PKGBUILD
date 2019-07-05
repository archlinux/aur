# Maintainer: Varakh <varakh@varakh.de>

pkgname=spotifyd-bin
pkgver=0.2.11
pkgrel=1
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/$pkgver/spotifyd-2019-06-19-x86.zip" "spotifyd.service")
sha256sums_armv7h=('66a5cb90ff16cca2269f96d827e5091a2bd47dfba5c161331315ed58ccda81f0'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('55996929e749310a726fd16fa601b98a784afc89e104c17d06ecadd1676c88e0'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/$pkgver/spotifyd-2019-06-19-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
