# Maintainer: VHSgunzo <vhsgrnz@gmail.com>
pkgname=btsspsw
pkgver=1.0
pkgrel=1
pkgdesc="Bluetooth Secure Simple Pairing (SSP) Switcher"
arch=('any')
url="https://github.com/VHSgunzo/btsspsw"
license=('MIT')
depends=('bluez' 'bluez-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the main script
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install the systemd service file
    install -Dm644 "$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
    
    # Install the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}