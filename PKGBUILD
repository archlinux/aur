# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.2.7
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

sha256sums_x86_64=('ead290d1f8f515e7ebb7da434e350e5aa58542737057263fbde7450c074985b8')
sha256sums_aarch64=('45fb4ffef67df782bfdceb0542316386782f24185617c9a0b12d3a37384e97bf')
sha256sums_armv7h=('a38ce436026a172e8047a6ac08bcbcc8175b0d5278deab6ea6da4066e62a85a3')

package() {
    install -Dm755 "$srcdir/git-stats"  "$pkgdir/usr/bin/git-stats"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
