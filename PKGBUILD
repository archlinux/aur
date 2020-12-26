# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kitsu mail@kitsu.me

pkgname=yofi
pkgver=0.1.3
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors."
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo')
source=("https://github.com/l4l/yofi/archive/0.1.3.tar.gz")
sha256sums=('9b1a61450a9abc4c2b7604a45bf1637efe33acb0f339b9858736b5b92738e61f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
}

