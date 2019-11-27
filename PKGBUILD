# Maintainer: Varakh <varakh@varakh.de>

pkgbase=spotifyd-bin
pkgname=('spotifyd-bin' 'spotifyd-bin-slim')
pkgver=0.2.20
pkgrel=1
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-dbus-mpris' 'spotifyd-git' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
depends=('alsa-lib')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/releases/download/v$pkgver/spotifyd-linux-slim.tar.gz" "spotifyd.service")
sha256sums=('db45c8df7eff78500f1f0b330f054ce095d7e2cb901f9f3dbb4931c96c8dcc7b'
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
