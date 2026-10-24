# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.3.2
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

sha256sums_x86_64=('c77ce6a7e87ac9e40fa5c1566771e6f655e6705ba399a5096e0c1ed1d2c4c930')
sha256sums_aarch64=('3f5483c8ad1ec49d8ac8ff7510e92902d504860125b38f34f41719110af604a5')
sha256sums_armv7h=('bb67b92b5ecc212df9bded7bbf4568bee44cd3eccd8cd6968106b36d8f58ed6e')

package() {
    install -Dm755 "$srcdir/git-stats"  "$pkgdir/usr/bin/git-stats"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
