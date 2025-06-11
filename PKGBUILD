# Maintainer: Voislav Vasiljevski <voyo@thelazysre.com>
pkgname=observer
pkgver=0.3.2
pkgrel=1
pkgdesc="Dynamic CPU core manager for power saving"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/voioo/observer"
license=('0BSD')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
backup=('etc/observer/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-linux-\$CARCH.tar.gz")
sha256sums=('SKIP') 

package() {
    cd "$srcdir"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"

    # Install systemd service
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install config file
    install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
}