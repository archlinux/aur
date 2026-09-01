# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.2.8
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

sha256sums_x86_64=('ad6f071be6d5c0440ca942456ceea7e0b5d3575a01528a4c38f594b0b048433a')
sha256sums_aarch64=('184ed8db1e13941cd78be3e7689200e8fd35cae2cfcbf475b60ba46ece6c082d')
sha256sums_armv7h=('5dd139a3ae26688ac0980bc17e73c7eade59c9c95c65d3529ef8354e7b198bc8')

package() {
    install -Dm755 "$srcdir/git-stats"  "$pkgdir/usr/bin/git-stats"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
