# Maintainer: Fyodor Perejoguine <fyodordev@gmail.com>
#
pkgname=swaybg-spread
pkgver=0.2.0
pkgrel=1
pkgdesc="Set wallpaper spanning multiple monitors on sway"
url="https://github.com/fyodordev/swaybg-spread"
license=("GPL3")
arch=("x86_64")
provides=("swaybg-spread")
conflicts=("swaybg-spread")
source=("$pkgname-$pkgver.tar.gz::https://github.com/fyodordev/swaybg-spread/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("d5dba6f3db8940c1427d54d0521f09007e374369a2bf2346d09b851a82eb5390")

build () {
  #cd "$pkgname-$pkgver"
  cargo build --release --target-dir target
}

package() {
  #cd "$pkgname-$pkgver"
  install -Dm755 target/release/swaybg-spread "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/docs/$pkgname/README.md"
}
