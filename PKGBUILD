# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.4.1
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_required_files.tar.gz")
license=('MIT')
sha512sums=('b5483871cbf56582d2503408c066ea6706b53a414d9d89d519f64714acfa50cc64734db9b2fae284d705f2c0d79abedb992223ff876b49eb5e1a56147fce9ab2')

build() {
    cargo build --release --locked
}

package() {
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}