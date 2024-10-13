# Maintainer: Energi <lukas.bloznelis@gmail.com>

pkgname=krowbar
pkgver=0.2.5
pkgrel=1
pkgdesc="BSPWM status bar"
arch=(x86_64)
url="https://github.com/bloznelis/krowbar"
license=(MIT)
groups=()
depends=(gtk4)
makedepends=(git cargo)
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+$url")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo check
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
