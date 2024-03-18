# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kitsu mail@kitsu.me

pkgname=yofi
pkgver=0.2.2
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors."
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/l4l/yofi/archive/$pkgver.tar.gz")
sha256sums=('a4dd8df03a6083b977f1085b5115dd76c09e3d9654837fe2ead5c3b4b78d3b24')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
