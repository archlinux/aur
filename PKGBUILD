# Maintainer: Catalin Croitoru <dkdekatron@gmail.com>
pkgname=t1161-driver-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Driver for Gotop/Vinsa T1161 tablet"
arch=('x86_64')
url="https://github.com/ColdyESP/t1161-driver"
license=('MIT')
depends=('libusb' 'systemd')
source=("https://github.com/ColdyESP/t1161-driver/releases/download/v${pkgver}-beta/t1161-driver-${pkgver}-x86_64.tar.gz"
        "t1161-driver.service"
        "99-t1161-driver.rules"
        "t1161-driver.install")

sha256sums=('a2f3537f33a69d0fa99483c7de01886075970250c7a395c967e16db8eaec84a7'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/t1161-driver-$pkgver/t1161-driver" "$pkgdir/usr/bin/t1161-driver"

    install -Dm644 t1161-driver.service \
        "$pkgdir/usr/lib/systemd/system/t1161-driver.service"

    install -Dm644 99-t1161-driver.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-t1161-driver.rules"

    install -Dm644 "$srcdir/t1161-driver-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/t1161-driver-$pkgver/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
