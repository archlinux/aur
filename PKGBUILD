# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.6.0
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
sha256sums=('96e6a2d41df1f19fc86f9d0c3285b81871d819fa3ef66f50f4f4e147fc456742')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
