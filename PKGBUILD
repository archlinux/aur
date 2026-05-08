# Maintainer: Alexander Björk <aur.operator320@passmail.net>
pkgname=sisr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Steam Input System Redirector - Binary"
arch=('x86_64')
url="https://github.com/Alia5/SISR"
license=('GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'sdl3' 'gtk3' 'openssl' 'xdotool' 'glib2' 'glibc' 'usbip')
provides=('sisr')
conflicts=('sisr')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/SISR-${CARCH}-linux-Release.tar.gz"
        "sisr.desktop"
        "sisr.conf"
        "99-sisr.rules")
sha256sums=('1de83eb5532a30e3208f556ab123482e2f2b08403e2d46e43f28fa38092e67fe'
            '48e579cace9e1bc0442fb80b8892d2dce32c8a1230c79fbb84c70929761ec67d'
            '8bd30d12950f630623b954da8caee6198d89f03d7ba16a25a0e8e96624b7a559'
            'e6484bcff94b3b10464e6bd69f6f75809382b0332db7008a6cfab06d18f5e829')

package() {

    cd "$srcdir"

    install -Dm755 "SISR" "$pkgdir/usr/bin/sisr"
    install -Dm644 "sisr.desktop" "$pkgdir/usr/share/applications/sisr.desktop"
    install -Dm644 "sisr.conf" "$pkgdir/usr/lib/modules-load.d/sisr.conf"
    install -Dm644 "99-sisr.rules" "$pkgdir/usr/lib/udev/rules.d/99-sisr.rules"
}
