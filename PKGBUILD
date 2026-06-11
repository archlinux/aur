# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.5.17
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
provides=('openring' "openring-rs=$pkgver")
conflicts=('openring' 'openring-rs')

_relurl="https://github.com/lukehsiao/openring-rs/releases/download/v$pkgver"
source=("openring-rs-$pkgver.tar.gz::https://github.com/lukehsiao/openring-rs/archive/v$pkgver.tar.gz")
source_x86_64=("$_relurl/openring-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_relurl/openring-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_relurl/openring-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums=('f729e0c1fe47c8032bb11e39f6f83d44986de4d1c4e88b9cb5ccaf2f94f0d27f')
sha256sums_x86_64=('4c074651c67e9e73a79f758cbc3cf2f13fea272c2b9adabce3a150d9cc78af2c')
sha256sums_aarch64=('db2ae4b96bf1fea01e662d945e9c1db220c08fe0dbb9398c20ce9183d438d034')
sha256sums_armv7h=('2ffd2fa751284c12cd0514c2948ab5e59d01f87952fc25ba54952cc428f5203f')

package() {
    install -Dm755 "$srcdir/openring" "$pkgdir/usr/bin/openring"
    cd "openring-rs-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
