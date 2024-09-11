# Maintainer: B0SE
pkgname=ani-dl
pkgver=1.5.7
pkgrel=1
depends=('yt-dlp' 'mpv')
makedepends=('rust' 'cargo')
arch=('any')
license=('GPL3')
url="https://github.com/B0SEmc/ani-dl"
pkgdesc="Download and watch animes in VF and VOSTFR (aka french versions)"
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
