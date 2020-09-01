# Maintainer: gbr <gbr@protonmail.com>

pkgname=rsmixer
pkgver=0.2.2
pkgrel=1
pkgdesc='PulseAudio volume mixer for the terminal'
arch=('x86_64')
url=https://github.com/jantap/rsmixer
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3b49553335f5b48379cc4f645b5ef04298d1b6110f7afa2a38288f34bfacb05c82d2dded9c0797700a19b0281d453ce58a5fd3c2ac3755b0fe0ca1010f28236a')

build() {
  cd "$pkgname-$pkgver"
  # TODO: add `--lock` for the next release
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  # TODO: add `--lock` for the next release
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

