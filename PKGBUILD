# Maintainer: Daniele Bartolini <dbartolini.aa gmail com> - https://github.com/dbartolini

replaces=('pepper')
pkgname=crown
pkgver=0.40.0
pkgrel=1
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/dbartolini/crown"
license=('MIT')
depends=('glib2>=2.48.2'
         'gtk3>=3.16'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/dbartolini/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        "crown.desktop"
        )
sha256sums=('bf2339e5e478d30d49788d6d4a89fb7fbc8d7ca33be8100919f25242a6827aeb'
            'a03e46e40bf1a08aecb97dfea2d22e3f7b61ab906a3f24e329a98fd6fb1a9b1d'
            'e8950a977117d524b56c5103126938430d787dbada535c9efaba266666ad3624')

package() {
    install -d "$pkgdir"/opt
    cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname

    # Launcher
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown"

    # License
    install -D -m644 $pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons
    install -D -m644 crown.desktop "${pkgdir}/usr/share/applications/crown.desktop"
    # for _res in 256x256 128x128 64x64 32x32 24x24 16x16; do
    #     install -D -m644 $pkgname/tools/icons/$_res/pepper.png "${pkgdir}/usr/share/icons/hicolor/$_res/apps/pepper.png"
    # done
    # install -D -m644 pepper.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pepper.svg"
}
