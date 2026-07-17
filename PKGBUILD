# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='A tool for getting aggregated commit stats (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/git-stats'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
provides=("git-stats=$pkgver")
conflicts=('git-stats')

_relurl="https://github.com/lukehsiao/git-stats/releases/download/v$pkgver"
source=("git-stats-$pkgver.tar.gz::https://github.com/lukehsiao/git-stats/archive/v$pkgver.tar.gz")
source_x86_64=("$_relurl/git-stats-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_relurl/git-stats-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_relurl/git-stats-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums=('fea859997fa5136df8732fa0fd1748425f9d37c32963dfbc74c55e47761b93de')
sha256sums_x86_64=('b4c3e29ff2663071c9160607026ddb500147048e5c7e7f470d46f00635a09048')
sha256sums_aarch64=('9264979dd7264478c6a9718389b71b7b4905d60036b95af1a5fb7d8baa977585')
sha256sums_armv7h=('b0cef4c03d9c67a1cc9b466a4a82353d5ff2c7bdf5c153c8b04c1336dbbf3397')

package() {
    install -Dm755 "$srcdir/git-stats" "$pkgdir/usr/bin/git-stats"
    cd "git-stats-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
