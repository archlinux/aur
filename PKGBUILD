# Contributor: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=wtftw
pkgver=1.2
pkgrel=2
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/Kintaro/wtftw"
license=('BSD')
depends=('xorg-xmessage' 'libxinerama' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.1.tar.gz")
md5sums=('fc937342074634cf348a7a1a6aa85bdc')

build() {
  cd "$pkgname-$pkgver.1"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver.1"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 config/config.rs -t "$pkgdir/usr/share/$pkgname"
}
