# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.8.3
pkgrel=1
pkgdesc="Powerful and flexible widget system for Linux"
arch=('x86_64')
url="https://github.com/Ewwii-sh/ewwii"
license=('GPL')
depends=()
makedepends=('cargo' 'gtk4' 'pkgconf' 'gtk4-layer-shell' 'graphene')
provides=('ewwii')
conflicts=('ewwii-bin' 'ewwii-git')
source=("https://github.com/Ewwii-sh/ewwii/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c612b24618e4d9b7c1d963a4a3dcf66c069f581291b3a3a421d3cf07030539a')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
