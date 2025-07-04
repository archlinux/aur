# Maintainer: Marcus Ziade <your-email@example.com>
pkgname=starcraft-cli
pkgver=2.0.0
pkgrel=2
pkgdesc="Command-line tool for tracking StarCraft 2 esports"
arch=('x86_64')
url="https://github.com/marcusziade/StarCraftKit"
license=('MIT')
depends=('glibc' 'swift-bin')
makedepends=('swift-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusziade/StarCraftKit/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('95fc2d8aa2926a26cb82f85fd4f07376b46eaf6d0be8b0b3617e28b859fb9de8')

build() {
    cd "StarCraftKit-$pkgver"
    swift build -c release --product starcraft-cli
}

package() {
    cd "StarCraftKit-$pkgver"
    install -Dm755 ".build/release/starcraft-cli" "$pkgdir/usr/bin/starcraft-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}