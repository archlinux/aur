# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.5.7
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

sha256sums=('505c04e08a527deb6d11f3f453ff0aedff6be9ff5dbda3712ca3fa4a670d307e')
sha256sums_x86_64=('00ae846fc130f8b05f42d6494b4e40a087b1f7d34ebd3152fd12d83d4fbaa188')
sha256sums_aarch64=('4c22fd8fb7ab165d80b0f3af63504e55d7a6409c5cff94bc5e71bd2c84b43f06')
sha256sums_armv7h=('49656a45ce227d79fb5edccce9603eeb3d2dff7acf5345d005ffbe36924ad543')

package() {
    install -Dm755 "$srcdir/openring" "$pkgdir/usr/bin/openring"
    cd "openring-rs-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
