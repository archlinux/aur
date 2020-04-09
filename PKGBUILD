# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.3.0
pkgrel=1
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver-2/bottom_required_files.tar.gz")
license=('MIT')
sha512sums=('a6d1c030f284851140a3ce0e0939bafb7bb5d07fc4810299a6f8af579ebf67ea5cdb4c05667fd7f423b64173e93386186971361be0fc56e6377e9266d755482e')

build() {
    cargo build --release --locked
}

package() {
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}