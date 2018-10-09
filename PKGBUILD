# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.4.5
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
md5sums=('a933ff56dc19fc70e068306b348ea7e8')
sha256sums=('d08e6f34b52f87604b575daba7a48a8803181f5605fa689e4f4ebec0c4e96f2c')
makedepends=('rust')
depends=('gcc-libs')
conflicts=('fselect-git')
provides=('fselect')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/fselect" "$pkgdir/usr/bin/fselect"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
