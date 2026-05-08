pkgname=psst-bin
pkgver=2026.05.08_351c1f4
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
sha256sums=('7751b0320f98eef6f6b731f8047dfe94cd83809686227247b24b5ec339d92410'
            'ca6cd059c7cb16806d9f75b4c754de0916c888af1697d8e8250a3956be4265ae'
            'da79acff7d35ef5c51ee6a516c852a4ad75e84ba83d3a0fbe789d677e627ebaf')

package() {
    install -Dm755 "psst-linux-x86_64-${pkgver}" "$pkgdir/usr/bin/psst"
    install -Dm644 psst.desktop "$pkgdir/usr/share/applications/psst.desktop"
    ln -s psst "$pkgdir/usr/bin/psst-gui"

    install -Dm644 psst.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/psst.png"
    install -Dm644 psst.png "$pkgdir/usr/share/pixmaps/psst.png"
}
