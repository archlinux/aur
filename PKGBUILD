# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kitsu mail@kitsu.me

pkgname=yofi
pkgver=0.1.5
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors."
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo')
source=("https://github.com/l4l/yofi/archive/$pkgver.tar.gz")
sha256sums=('7ed1acc7570179baebefe8359db7e23e52f46bfcda1fe01eca6f53eda3120383')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
}

