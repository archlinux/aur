# Maintainer: Daniele Bartolini <dbartolini crownengine org>

replaces=('pepper')
pkgname=crown
pkgver=0.52.0
pkgrel=2
pkgdesc="Crown is a complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.48.2'
         'gtk3>=3.24'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/crownengine/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        "crown.desktop"
        "icons.tar.gz"
        )
sha256sums=('3442daab2d0e5402b891c9ac1c4d9c72b90f638a13869b9aa323d3c62e5e01d0'
            '0c4170cc61e5f802763ab335dcc151a0dcf421c21e624225d28ce025fe666a91'
            'e8950a977117d524b56c5103126938430d787dbada535c9efaba266666ad3624'
            '18a3bbbd9cedbc1e988270003b857add433cc2d140fb2462b4d129a99283824c')
options=('!strip')

package() {
    install -d "$pkgdir"/opt
    cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname

    # Launcher
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown"

    # License
    install -D -m644 $pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons
    install -D -m644 crown.desktop "${pkgdir}/usr/share/applications/crown.desktop"
    install -D -m644 icons/crown-black-socket.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/crown.svg"
}
