# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.6.4
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

sha256sums_x86_64=('3a7101fce3ba246a5468b041514ec8e51daccc1226d9cfaf0458daf563c4caa1')
sha256sums_aarch64=('11de7e85d79cff7bccb35f61c3e3fc1daea64cdeb169fadb9f13f5f5ef0d0c87')
sha256sums_armv7h=('4654ac2b72cdc8cedcc9e033029396734ba28c6e0c4543abb6bcbc6d08fc9d3d')

package() {
    install -Dm755 "$srcdir/openring"   "$pkgdir/usr/bin/openring"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
