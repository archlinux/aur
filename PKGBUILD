# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.6.2
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

sha256sums_x86_64=('adb7b9eca77dc2d872dc5410df0887323c1bd374f2239f98f5f201f39e7230f3')
sha256sums_aarch64=('2bd8b7d4c12286bcfcb96197711abd8629ea170f3ab9f0787e638403122212ec')
sha256sums_armv7h=('f7ed9120cd55de832f831647f6d196d31f61e6346f6b85409ceaa8a01763f6d1')

package() {
    install -Dm755 "$srcdir/openring"   "$pkgdir/usr/bin/openring"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
