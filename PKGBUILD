# Maintainer: Daniel Seichter <daniel.seichter@dseichter.de>
pkgname=yahac-bin
pkgver=2026.03.16.beta5
pkgrel=1
pkgdesc="Yet Another Home Assistant Client - prebuilt desktop tray application"
arch=('x86_64')
url="https://github.com/dseichter/yahac"
license=('GPL3')
options=('!debug')
depends=('glibc')
optdepends=('libnotify: Desktop notifications')
source=(
    "yahac::https://github.com/dseichter/yahac/releases/download/v${pkgver//./-}/yahac-ubuntu-24-04-v${pkgver//./-}"
    "io.github.dseichter.yahac.desktop::https://raw.githubusercontent.com/dseichter/yahac/v${pkgver//./-}/packaging/debian/io.github.dseichter.yahac.desktop"
    "io.github.dseichter.yahac.png::https://raw.githubusercontent.com/dseichter/yahac/v${pkgver//./-}/icons/io.github.dseichter.yahac.png"
)
sha256sums=('493b2c2d05db588d98b67dcb97d360421136e1245b3ee79ec6efb2851d0cc049' 'SKIP' 'SKIP')

package() {
    install -Dm755 "yahac" "$pkgdir/usr/bin/yahac"
    install -Dm644 "io.github.dseichter.yahac.desktop" "$pkgdir/usr/share/applications/io.github.dseichter.yahac.desktop"
    install -Dm644 "io.github.dseichter.yahac.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dseichter.yahac.png"
}