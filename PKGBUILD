# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ck-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="Local first semantic and hybrid BM25 grep/search tool for use by AI and humans"
arch=('x86_64')
url="https://github.com/BeaconBay/ck"
license=('Apache-2.0' 'MIT')
provides=('ck')
conflicts=('ck')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BeaconBay/ck/releases/download/${pkgver}/ck-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('066b7f3e7448608e36d792615a17cdc1a8ecce65dbd8b511621c9594d43b8cf1')

latestver() {
    curl -s "https://api.github.com/repos/BeaconBay/ck/releases/latest" |
    jq -r '.tag_name' | sed 's/^v//'
}

package() {
    cd "$srcdir"

    install -Dm755 ck "$pkgdir/usr/bin/ck"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
