# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.6.3
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

sha256sums_x86_64=('74894a65a8915c318d375cbcd15905820e1956ee208d5fe2fd114c5a6b67702e')
sha256sums_aarch64=('bc66576079e04aafa3aadb635798429e5843d6bc6c4605ff27bdd6bc976bfb3c')
sha256sums_armv7h=('a9c332ab42d59fbcc2b23af4d4839b581f3a1e7f82f11edcd5ebf8ac3451bc59')

package() {
    install -Dm755 "$srcdir/openring"   "$pkgdir/usr/bin/openring"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
