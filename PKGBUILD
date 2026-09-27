# Maintainer: Pekururu
pkgname=armasync-bin
pkgver=0.5.1
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
sha256sums=('18cadec8a3057f507194c815f1be0a9986ae30f5d6e8b3be8b38b0059199c2b5')

package() {
    cd "$srcdir"
    bsdtar -xf "armasync-$pkgver.deb"
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
