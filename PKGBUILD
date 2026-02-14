# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.4.0
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
sha256sums=('bce134ab00bcc52427e02a8c6bcd191a1891b23316c2e10bc12a09d1d3dbf305')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
