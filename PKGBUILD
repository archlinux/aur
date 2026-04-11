# Maintainer: Berke Oruc <berke@oruc.dev>
# Contributor: Berke Oruc <berke@oruc.dev>

pkgname=oplire
pkgver=0.1.0
pkgrel=1
pkgdesc="Reset OpenCode rate limit by managing Cloudflare WARP tunnel"
arch=('x86_64')
url="https://github.com/BerkeOruc/oplire"
license=('MIT')
makedepends=('cargo')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BerkeOruc/oplire/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/oplire "$pkgdir/usr/bin/oplire"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}