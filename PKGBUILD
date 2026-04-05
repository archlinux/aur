# Maintainer: Zarif <your.email@example.com>
pkgname=udvash-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to fetch and play Udvash live classes directly in mpv"
arch=('x86_64')
url="https://github.com/123zarif/udvash-cli"
license=('MIT') 
depends=('mpv' 'gcc-libs')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0bf33377028603182408d9a19d8be566ee92087cc5a7edbb8ab2cff3de142c33')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
