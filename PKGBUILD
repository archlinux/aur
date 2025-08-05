# Maintainer: dozaxcx <your-email@example.com>
pkgname=koteyfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Красивая системная утилита с котиком для отображения информации о системе"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/dozaxcx/koteyfetch"
license=('MIT')
depends=('gcc-libs' 'curl')
makedepends=('gcc')
source=("koteyfetch.cpp" "LICENSE" "README.md")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
  g++ koteyfetch.cpp -o koteyfetch
}

package() {
  install -Dm755 koteyfetch "$pkgdir/usr/bin/koteyfetch"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

