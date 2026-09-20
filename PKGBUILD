# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xadi
pkgver=0.4.0
pkgrel=2
pkgdesc="CoreADI wrapper based on libprovision "
arch=('x86_64')
url="https://github.com/xtool-org/xadi"
license=('LGPL')
depends=()
makedepends=(
  'dub'
  'ldc'
  'git'
)
_commit="61c02708c9cb046100f500878863fd2122b0d7e3"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/xadi/archive/refs/tags/source-${pkgver}.tar.gz")
b2sums=('41072a590630ad6f3bf1636f90f94ce2a905acec42165dc6a0c74b58ba464c2d5245c85f142132c536927a736e45a3cfd48af49255a6b258ca52f896d003db3e')

build() {
  cd "$pkgname-source-$pkgver"
  ./Linux/build.sh
}

package() {
  cd "$pkgname-source-$pkgver"

  install -Dm644 "bin/libxadibase.a" "$pkgdir/usr/lib/libxadibase.a"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
