# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
pkgname=f1multiviewer-bin
pkgver=1.11.6
pkgrel=1
pkgdesc="Unofficial desktop client for F1TV"
arch=('x86_64')
url="https://beta.f1mv.com/"
license=('unknown')  # Licenses in the dist apply to Electron, not f1multiviewer
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core')
provides=('f1multiviewer')
conflicts=('f1multiviewer')
install=
source=("https://releases.f1mv.com/download/85211355/MultiViewer.for.F1-linux-x64-1.11.6.zip"
    "f1multiviewer.desktop")
noextract=()
sha256sums=('e6a598829c31650a9a42dcc3650db60f1dc8500c07d5b62293ae02d3648a7f3e'
            'f6245ecb0392c1f863ce46d61865995be9f226769e54fbce3e407e979e72bbf7')

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -a "MultiViewer for F1-linux-x64/." "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname/MultiViewer for F1"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/MultiViewer for F1" "$pkgdir/usr/bin/f1multiviewer"
    install -Dm644 "MultiViewer for F1-linux-x64/resources/app/.webpack/main/88a36af69fdc182ce561a66de78de7b1.png" "$pkgdir/usr/share/pixmaps/f1multiviewer.png"
    install -Dm644 f1multiviewer.desktop "$pkgdir/usr/share/applications/f1multiviewer.desktop"

    install -Dm644 "MultiViewer for F1-linux-x64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/Electron-LICENSE"
    install -Dm644 "MultiViewer for F1-linux-x64/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
