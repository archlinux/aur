# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.5.11
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

sha256sums=('3003f36e73dc20dccd4c466725f746c6ae1319f959e28091bd036eb8cc41e70c')
sha256sums_x86_64=('eb8ffe892f444eb05791472045ea6052ebba7607c8be9d36b9b0ffa5a805baeb')
sha256sums_aarch64=('fc77ff553e4792372bd573c306ec15dfdb8b8a8a21d4c957bc3c9cad4f8aa3ba')
sha256sums_armv7h=('d7f6066a0f7582988a00fe55c506b06e9b633f1aff3a7cba18c1bc608fc66ec0')

package() {
    install -Dm755 "$srcdir/openring" "$pkgdir/usr/bin/openring"
    cd "openring-rs-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
