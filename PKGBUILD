# Maintainer: Varakh <varakh@varakh.de>

pkgname=spotifyd-bin
pkgver=0.2.5
pkgrel=1
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2019-02-25-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('1b00528a0de11033ebcc4e796d7227e7799293abf174a08382c28a02371d914a'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('11b1ea0363cd3e217bf2553bffa49380a834c8b4a5b8d4f5aee1fd434fdefdce'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-2019-02-25-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
