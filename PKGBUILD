# Maintainer: Daniele Bartolini <dbartolini.aa gmail com> - https://github.com/dbartolini

replaces=('pepper')
pkgname=crown
pkgver=0.39.0
pkgrel=1
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/dbartolini/crown"
license=('MIT')
depends=('glib2>=2.48.2'
         'gtk3>=3.16'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/dbartolini/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        "crown.desktop"
        )
sha256sums=('a9f9674b0df3af56415d25d682e20bcc3f6875052c13f7d751c811fabb87ba89'
            '96f19db60857c1a4db31f1d115ad77b99f6c11aecbab4239f2adcb98cac66d78'
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
