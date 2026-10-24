# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.6.6
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

sha256sums_x86_64=('06d38a0c64d619f8d8d3645cae31180acf261978bb87283adb16a02ed83cb703')
sha256sums_aarch64=('f7ab00f3bb71f1b5aa2227f847cd44dcfc56468c93513d68cf977569c9887a97')
sha256sums_armv7h=('f84c33a8a53921b3cee78d040bcaee81bbac22a6c27c2400e99dad537173ec03')

package() {
    install -Dm755 "$srcdir/openring"   "$pkgdir/usr/bin/openring"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
