# Maintainer: Varakh <varakh@varakh.de>

pkgname=spotifyd-bin
pkgver=0.2.4
pkgrel=1
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2019-01-28-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('49566f012d74f9dc0aa77a5c52e55c08ca480c9a0602d1353690b67413d1d2bd'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('00ae961ed6b79a45f5092b77af493f42107507b3f6aa420d725333f0331ff483'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2019-01-28-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
