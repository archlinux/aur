# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.5.8
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

sha256sums=('67722b4b85b662d00951432423dde0c7aa73751b3cf7f17935e35593dbf93a6c')
sha256sums_x86_64=('512986235d1d25511d94c86958897264e497726e1639d24c8f10affbee8738ed')
sha256sums_aarch64=('0fbc9892cf3bcb6e211b41a9192b5761e81008b175feb4966a9e2778123fc295')
sha256sums_armv7h=('8e388d40b2b10ff49b2de042c44d6a857958abcc7bbb7902fecad5e186677cee')

package() {
    install -Dm755 "$srcdir/openring" "$pkgdir/usr/bin/openring"
    cd "openring-rs-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
