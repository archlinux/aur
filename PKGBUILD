# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='A tool for getting aggregated commit stats (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/git-stats'
license=('BlueOak-1.0.0')
depends=('glibc' 'libgcc')
provides=("git-stats=$pkgver")
conflicts=('git-stats')

# The release tarballs carry LICENSE.md and README.md alongside the binary, so
# no GitHub archive/ tarball is needed; those are not byte-stable over time.
_relurl="https://github.com/lukehsiao/git-stats/releases/download/v$pkgver"
source_x86_64=("git-stats-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$_relurl/git-stats-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("git-stats-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$_relurl/git-stats-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("git-stats-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz::$_relurl/git-stats-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('dddd256d30a819cbcca4e8c6c93c4827a322a739bb297a18a823b4cb7ed0a58c')
sha256sums_aarch64=('b01935d963580fb51baed8d3ff1c5a67d37ae25885a22507bc7cab23854a88f3')
sha256sums_armv7h=('5bc4b1db9f0dc5697611deeb21fee4b2cdfc6f1b3b880a38f32191b7936269eb')

package() {
    install -Dm755 "$srcdir/git-stats"  "$pkgdir/usr/bin/git-stats"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
