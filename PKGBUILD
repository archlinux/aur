# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wtftw
pkgver=1.2.1
pkgrel=1
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust'
arch=('x86_64')
url="https://github.com/orhun/wtftw"
license=('custom')
depends=('xorg-xmessage' 'libxinerama')
makedepends=('cargo')
install=wtftw.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('fc937342074634cf348a7a1a6aa85bdc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 config/config.rs -t "$pkgdir/usr/share/$pkgname"
}
