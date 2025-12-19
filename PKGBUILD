pkgname=psst-bin
pkgver=2025.12.19_4325f5d
pkgrel=0
pkgdesc="Fast and multi-platform Spotify client with native GUI"
arch=('x86_64')
url="https://github.com/jpochyla/psst"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'openssl')
conflicts=("psst-git" "psst-git-bin")
source=("psst-linux-x86_64-${pkgver}::$url/releases/download/rolling/psst-linux-x86_64"
        "psst.desktop::https://raw.githubusercontent.com/jpochyla/psst/refs/heads/main/.pkg/psst.desktop"
        "logo_32.png::https://github.com/jpochyla/psst/blob/main/psst-gui/assets/logo_32.png?raw=true"
        "logo_64.png::https://github.com/jpochyla/psst/blob/main/psst-gui/assets/logo_64.png?raw=true"
        "logo_128.png::https://github.com/jpochyla/psst/blob/main/psst-gui/assets/logo_128.png?raw=true"
        "logo_256.png::https://github.com/jpochyla/psst/blob/main/psst-gui/assets/logo_256.png?raw=true"
        "logo_512.png::https://github.com/jpochyla/psst/blob/main/psst-gui/assets/logo_512.png?raw=true"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "psst-linux-x86_64-${pkgver}" "$pkgdir/usr/bin/psst"
    install -Dm644 psst.desktop "$pkgdir/usr/share/applications/psst.desktop"
    ln -s psst "$pkgdir/usr/bin/psst-gui"
    
    install -Dm644 logo_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/psst.png"
    install -Dm644 logo_64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/psst.png"
    install -Dm644 logo_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/psst.png"
    install -Dm644 logo_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/psst.png"
    install -Dm644 logo_512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/psst.png"

    install -Dm644 logo_512.png "$pkgdir/usr/share/pixmaps/psst.png"
}