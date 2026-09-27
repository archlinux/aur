# Maintainer: Pekururu
pkgname=armasync-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Native Linux Arma 3 launcher and addon manager (Arma3Sync-compatible)"
arch=('x86_64')
url="https://github.com/Pekururu/Armasync-Linux"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('steam: install and launch Arma 3 with Proton'
            'protontricks: TeamSpeak/ACRE voice setup'
            'wireplumber: audio device detection'
            'pipewire-pulse: TeamSpeak audio under Proton'
            'zstd: restore points and support bundles')
provides=('armasync')
conflicts=('armasync')
options=('!debug' '!strip')
source=("armasync-$pkgver.deb::https://github.com/Pekururu/Armasync-Linux/releases/download/v$pkgver/Armasync_${pkgver}_amd64.deb")
sha256sums=('9347397ce73a54c5a54c82e77e37f487569b422b6d30e61106e00174defc4d44')

package() {
    cd "$srcdir"
    bsdtar -xf "armasync-$pkgver.deb"
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
