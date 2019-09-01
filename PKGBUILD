# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=maketorrent
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI .torrent file generator written in Rust"
arch=('x86_64')
url="https://github.com/fuchsi/maketorrent"
license=('GPL3')
depends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('20c9babb7d0e32e7b168a71990446005')

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    install -Dm 755 "$pkgname-$pkgver"/target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
