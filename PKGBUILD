# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kitsu mail@kitsu.me

pkgname=yofi
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors."
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo')
source=("https://github.com/l4l/yofi/archive/$pkgver.tar.gz")
sha256sums=('343541731f5fe771e47e4516eb95dd057e7d3c0837f7ba7e529fc663f77ba074')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
