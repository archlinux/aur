# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac-bin
pkgver=2026.03.16.beta21
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
sha256sums=('ea9f257b06383045b93c646a7be297d83e6b4fd8d694b6e936d63c4a75f32f07' 'SKIP' 'SKIP')

package() {
    install -Dm755 "yahac" "$pkgdir/usr/bin/yahac"
    install -Dm644 "io.github.dseichter.yahac.desktop" "$pkgdir/usr/share/applications/io.github.dseichter.yahac.desktop"
    install -Dm644 "io.github.dseichter.yahac.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dseichter.yahac.png"
}