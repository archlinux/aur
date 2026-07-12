# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=git-stats-bin
pkgver=0.2.5
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

sha256sums=('c96dd422845c0522a751570303ddbe8dbcc206fac5cb0387620f8418167028c2')
sha256sums_x86_64=('146bd622f7a5f11514390a626582368cdafc97ac7ebb3526db89bd744f4a527c')
sha256sums_aarch64=('44cea394cbecaf500460dd769d9827997fb8d89180fb421fa6f7657f4e0716ed')
sha256sums_armv7h=('d94a7afac38069e647a876bea1bbb62377210305e8ea6490755831a21cce9ae4')

package() {
    install -Dm755 "$srcdir/git-stats" "$pkgdir/usr/bin/git-stats"
    cd "git-stats-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
