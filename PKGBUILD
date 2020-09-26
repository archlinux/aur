# Maintainer: gbr <gbr@protonmail.com>

pkgname=rsmixer
pkgver=0.2.4
pkgrel=1
pkgdesc='PulseAudio volume mixer for the terminal'
arch=('x86_64')
url=https://github.com/jantap/rsmixer
license=('MIT')
depends=('gcc-libs' 'libpulse')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('33666f4cda64844544c14984cd8a1fa4679e6b82cd5537faff1656a5aebcf3ab3445195bcc0bcc5ca7a2327ab694b67dec5b8e15b6862f932bc075acbde8bda1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

