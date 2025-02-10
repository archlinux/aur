# Maintainer: sprobie1
pkgname=flex-launcher-bin
pkgver=2.2
pkgrel=2
pkgdesc='Launcher interface for HTPCs'
url='https://github.com/complexlogic/flex-launcher'
source=("https://github.com/complexlogic/flex-launcher/releases/download/v2.2/flex-launcher-$pkgver-1-x86_64.pkg.tar.zst")
arch=('x86_64')
license=('Unlicense')
depends=('sdl2-compat' 'sdl2_image' 'sdl2_ttf' 'libinih')
conflicts=('flex-launcher')
provides=('flex-launcher')
sha256sums=('063323bb766cfc6e9c1d9836067572dcb24c6f0227a54df38573068a58baf673')
install="${pkgname}.install"

package() {
    cd "$srcdir/"

    install -Dm755 "usr/bin/flex-launcher" "${pkgdir}/usr/bin/flex-launcher"

    install -Dm644 "usr/share/applications/flex-launcher.desktop" "${pkgdir}/usr/share/applications/flex-laucher.desktop"

    install -Dm644 "usr/share/icons/hicolor/48x48/apps/flex-launcher.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/flex-launcher.png"
    install -Dm644 "usr/share/icons/hicolor/scalable/apps/flex-launcher.svg" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/flex-launcher.svg"

    cp -r usr/share/flex-launcher "${pkgdir}/usr/share/flex-launcher"
}
