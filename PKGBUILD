# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Jack Random <jack (at) random.to>

# Original contributors (renoise-demo):
# Samæ <eeva.samæ@marvid.fr>
# Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

pkgname=renoise-demo
pkgver=3.4.1
pkgrel=1
pkgdesc="A music composition program"
arch=("x86_64")
url="https://www.renoise.com"
license=("custom:renoise")
depends=("alsa-lib" "gcc-libs" "hicolor-icon-theme" "libxext")
optdepends=("jack: For JACK audio support")
options=("!strip")
conflicts=("renoise" "renoise3-demo")

source=("https://files.renoise.com/demo/Renoise_${pkgver//./_}_Demo_Linux_x86_64.tar.gz")
sha512sums=('499fd07ada10c784f91adc9c9b94a3a9f006157eea274da4b0a86fba6be23444604640c64e55aaf30475523b63814089805ad5c6ec4e8bd49ea1a31e9f59d8a2')

package() {
    cd "Renoise_${pkgver//./_}_Demo_Linux_x86_64"

    mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
    cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

    install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise"
    install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise.desktop"
    install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise.1.gz"
    install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise-pattern-effects.5.gz"
    install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 "Installer/renoise.xml" "$pkgdir/usr/share/mime/packages/renoise.xml"
    install -Dm 644 "Installer/renoise-48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise.png"
    install -Dm 644 "Installer/renoise-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/renoise.png"
    install -Dm 644 "Installer/renoise-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/renoise.png"
}
