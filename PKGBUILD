# Maintainer: Audey Godfrey-Prewett
# audeygodfrey@gmail.com

pkgname=ferret-scanner
pkgver=0.1.2
pkgrel=1
pkgdesc='Ferret out secrets and vulnerabilities in your API collections'
arch=('x86_64' 'aarch64')
url='https://github.com/BitsBob/ferret'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d38a98dc55bf6e8d24081bbb1917e02ed14bba225cd7a638a62d7cb050b92e4')

prepare() {
    cd "ferret-$pkgver"
}

build() {
    cd "ferret-$pkgver"
    cargo build --release
}

package() {
    cd "ferret-$pkgver"
    install -Dm755 "target/release/ferret" "$pkgdir/usr/bin/ferret-scanner"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
