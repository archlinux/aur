# Maintainer: VHSgunzo <vhsgrnz@gmail.com>
pkgname='btsspsw-bin'
binname="${pkgname%-bin}"
pkgver='1.1'
pkgrel='1'
pkgdesc="Bluetooth Secure Simple Pairing (SSP) Switcher"
arch=('any')
url='https://github.com/VHSgunzo/btsspsw'
license=('MIT')
depends=('bluez' 'bluez-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
install='btsspsw.install'
provides=("${binname}")
conflicts=("${binname}" "${binname}-git")

package() {
    cd "$srcdir/$binname-$pkgver"

    # Install the main script
    install -Dm755 "$binname" "$pkgdir/usr/bin/$binname"

    # Install the systemd service file
    install -Dm644 "$binname.service" "$pkgdir/etc/systemd/system/$binname.service"

    # Install the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$binname/LICENSE"
}
