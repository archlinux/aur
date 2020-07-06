# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.4.4
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
conflicts=('bottom-bin')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_required_files.tar.gz")
license=('MIT')
sha512sums=('80dbc1f8fab6511019eb1a73df8671bdae3f5d36a53053f053e6a2edb4f63f7291a6b2095b683c0de608992c8feca08d0bd56974497220b3f5737a6ed10b115d')

build() {
    cargo build --release --locked
}

package() {
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}