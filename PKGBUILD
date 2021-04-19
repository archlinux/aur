# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kitsu mail@kitsu.me

pkgname=yofi
pkgver=0.1.4
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors."
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo')
source=("https://github.com/l4l/yofi/archive/$pkgver.tar.gz")
sha256sums=('daffc1f13e0bbc3c921c9949285cec42d11c9f1bb9f7264c992bd4d7da4fbabb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
}

