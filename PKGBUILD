# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.6.5
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('glibc' 'libgcc')
provides=('openring' "openring-rs=$pkgver")
conflicts=('openring' 'openring-rs')

# The release tarballs carry LICENSE.md and README.md alongside the binary, so
# no GitHub archive/ tarball is needed; those are not byte-stable over time.
_relurl="https://github.com/lukehsiao/openring-rs/releases/download/v$pkgver"
source_x86_64=("openring-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$_relurl/openring-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("openring-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$_relurl/openring-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("openring-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz::$_relurl/openring-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('b3e01c119a6f43d76926b967ace5be4f8d8954c9f58b1a823d87556bc90dea00')
sha256sums_aarch64=('c5b5a7eee2f6c76895a87cbe2abbe579d4bfcda180b07faa9ec96de9c6c7acd9')
sha256sums_armv7h=('f665a2b2644e92ad1c3b2ce879c76621d0a92b284e135c34b0680f2534c0006c')

package() {
    install -Dm755 "$srcdir/openring"   "$pkgdir/usr/bin/openring"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
