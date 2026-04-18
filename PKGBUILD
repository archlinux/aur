# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.5.0
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
sha256sums=('62a23e2c5686e2cd42ce63330a6597faf7d926b02a2345a9ce5fa0c6227aa8b6')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
