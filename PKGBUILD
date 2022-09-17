# Maintainer: mib <mib@mib.dev>
pkgname=lightburn-bin
pkgver=1.2.01
pkgrel=2
pkgdesc="A layout, editing, and control software for lastercutters."
arch=('x86_64')
url="https://lightburnsoftware.com"
license=('unknown')
depends=('qt5-multimedia' 'qt5-serialport')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('lightburn.desktop' "https://github.com/LightBurnSoftware/deployment/releases/download/$pkgver/LightBurn-Linux64-v$pkgver.7z")
sha256sums=('fdab4fbe0e5937027a5f046c1b45d51bc0bbb40f9cd6ad27bbd4904cde04cf93'
            '57886cc328fa2f2ea29da2251e5c69bc447c6abd3dc19e7901dfb11f819b1dfb')

package() {
    # Desktop entry & icon
    install -Dm 644 "lightburn.desktop" "$pkgdir/usr/share/applications/lightburn.desktop"
    install -Dm 755 "$srcdir/LightBurn/LightBurn.png" "$pkgdir/usr/share/pixmaps/lightburn.png"

    install -Dm 755 "$srcdir/LightBurn/LightBurn" "$pkgdir/usr/bin/lightburn"
}
