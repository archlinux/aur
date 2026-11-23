pkgname=syk-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Search folder names, file names and file contents in one pass"
arch=('x86_64' 'aarch64')
url="https://github.com/remcostoeten/syk"
license=('MIT')
depends=('glibc' 'libgcc')
provides=('syk')
conflicts=('syk')
options=('!debug' '!strip')
source_x86_64=("syk-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/syk-search-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("syk-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/syk-search-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('05162d1f734ca58764cb105c422692189c5ccee992e4ad62e30ff6df984da1c3')
sha256sums_aarch64=('0f7106b5aaecb3998fe507659fb70ed9ebedbae5b3fd9fa3209aad58e724f804')

package() {
    cd "syk-search-$CARCH-unknown-linux-gnu"
    install -Dm755 syk "$pkgdir/usr/bin/syk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
