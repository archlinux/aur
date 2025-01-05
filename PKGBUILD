# Maintainer: Voislav Vasiljevski <voyo@thelazysre.com>
pkgname=observer
pkgver=0.1.1
pkgrel=1
pkgdesc="Dynamic CPU core manager for power saving"
arch=('x86_64')
url="https://github.com/voioo/observer"
license=('0BSD')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
backup=('etc/observer/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
sha256sums=('e0f1ab04087219719bca4f3743b92da4ace6bc8e030afc5f4f0ae61406ef1831') 

package() {
    cd "$srcdir"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"

    # Install systemd service
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install config file
    install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
}