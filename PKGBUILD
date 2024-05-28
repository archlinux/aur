# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Jack Random <jack (at) random.to>

# Original contributors (renoise-demo):
# Samæ <eeva.samæ@marvid.fr>
# Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

pkgname=renoise-demo
pkgver=3.4.4
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
sha512sums=('806f23563bb3ffdc7797f4e14b313d1d2bc8c68c4f71670a43e06f59ffa84260ab8ca492105d017b8698577a7819c2262ad60d1fbcb58969347c96583a664965')

package() {
    cd "Renoise_${pkgver}_Demo_Linux_x86_64"

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
