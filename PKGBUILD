# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac-bin
pkgver=2026.03.21
pkgrel=1
pkgdesc="Yet Another Home Assistant Client - prebuilt desktop tray application"
arch=('x86_64')
url="https://github.com/dseichter/yahac"
license=('GPL3')
options=('!debug')
depends=('glibc')
optdepends=('libnotify: Desktop notifications')
source=(
    "yahac::https://github.com/dseichter/yahac/releases/download/v${pkgver//./-}/yahac-archlinux-x86_64-v${pkgver//./-}"
    "io.github.dseichter.yahac.desktop::https://raw.githubusercontent.com/dseichter/yahac/v${pkgver//./-}/packaging/debian/io.github.dseichter.yahac.desktop"
    "io.github.dseichter.yahac.png::https://raw.githubusercontent.com/dseichter/yahac/v${pkgver//./-}/icons/io.github.dseichter.yahac.png"
)
sha256sums=('742634c8d1ad2b398ad4a70682be2504df7f257371cfd070306f980903e9e28d' 'SKIP' 'SKIP')

package() {
    install -Dm755 "yahac" "$pkgdir/usr/bin/yahac"
    install -Dm644 "io.github.dseichter.yahac.desktop" "$pkgdir/usr/share/applications/io.github.dseichter.yahac.desktop"
    install -Dm644 "io.github.dseichter.yahac.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dseichter.yahac.png"
    install -Dm644 "io.github.dseichter.yahac.png" "$pkgdir/usr/share/pixmaps/io.github.dseichter.yahac.png"
}