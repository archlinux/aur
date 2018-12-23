# Maintainer: Varakh <varakh@varakh.de>

pkgname=spotifyd-bin
pkgver=0.2.3
pkgrel=1
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2018-10-21-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('6e54effa036a34e60596d766e5553932590b3489fbc0e769ec3c24f3bd1e2288'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('3c31a17f70164448192b6686266fc2151f2a492135bafbc82f61c515381ca12a'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2018-10-21-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
