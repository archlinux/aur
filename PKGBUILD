pkgname=psst-bin
pkgver=2026.05.05_b9c4cab
pkgrel=1
pkgdesc="Fast and multi-platform Spotify client with native GUI (binary git version)"
arch=('x86_64')
url="https://github.com/jpochyla/psst"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'openssl')
conflicts=("psst-git" "psst-git-bin")
source=("psst-linux-x86_64-${pkgver}::$url/releases/download/rolling/psst-linux-x86_64"
        "psst.desktop::https://raw.githubusercontent.com/jpochyla/psst/refs/heads/main/.pkg/psst.desktop"
        "psst.png::https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_512.png"
        )
sha256sums=('97424fcb2a2773471c1bf1a333148f269f321950e3be93a3e5ecce5164e62e81'
            'ca6cd059c7cb16806d9f75b4c754de0916c888af1697d8e8250a3956be4265ae'
            'da79acff7d35ef5c51ee6a516c852a4ad75e84ba83d3a0fbe789d677e627ebaf')

package() {
    install -Dm755 "psst-linux-x86_64-${pkgver}" "$pkgdir/usr/bin/psst"
    install -Dm644 psst.desktop "$pkgdir/usr/share/applications/psst.desktop"
    ln -s psst "$pkgdir/usr/bin/psst-gui"

    install -Dm644 psst.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/psst.png"
    install -Dm644 psst.png "$pkgdir/usr/share/pixmaps/psst.png"
}
