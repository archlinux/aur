# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Thomas Recloux <thomas at recloux dot fr>

pkgname="rustic-backup"
pkgver=0.2.1
pkgrel=1
pkgdesc="A wrapper around the Restic backup program"
url="https://github.com/bnavetta/rustic"
license=(MIT)
arch=("x86_64" "aarch64" "arm7h")
depends=("restic")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bnavetta/rustic/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f807b0d60b9af81e356318c756cc7278bdc1bb5f56a16337e8a393b6b074c98fda68f9974453ff7d91524fe0353e262633f3c4ded6df38d8ae242fa89c17d372')

build(){
 cd "rustic-$pkgver"
 cargo build --release
}

package(){
 cd "rustic-$pkgver"
 install -Dm755 "target/release/rustic" "$pkgdir/usr/bin/$pkgname"
}
