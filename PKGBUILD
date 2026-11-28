# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.3.3
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

sha256sums_x86_64=('856f2915b3d7834ef31833a0b847ede5425f976b3217f1cff50bcb86342d614b')
sha256sums_aarch64=('fbdf9cef4ab41c9135f73a2dfd582519616d51c076f62a66309c8c5d2e472260')
sha256sums_armv7h=('7627248bdaf93102cafcee2ccc0c152602fb09a9a4e9f73945d18af679072841')

package() {
    install -Dm755 "$srcdir/git-stats"  "$pkgdir/usr/bin/git-stats"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
