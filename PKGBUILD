# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=onefetch
pkgver=1.0.0
pkgrel=2
makedepends=('rust' 'cargo')
url="https://github.com/o2sh/onefetch"
pkgdesc="Displays information about your project directly on your terminal"
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('1ea710f40e618ca5401e42ea9ed65c86364fe871cd498582d2ee38bbdbe5f127')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
