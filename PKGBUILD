# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xadi
pkgver=0.0.0.6
pkgrel=1
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
source=(
  "git+https://github.com/xtool-org/xadi.git#commit=${_commit}"
)
b2sums=('d4d08cbf53edd4f74ce577a0f33c524db85a5d9edb9e2bf7daeee53cbeb0822d14fcc3a175f670f7359dbd62010a0404f00fa14e346f8a71381f58eb02f5e597')

build() {
  cd "$pkgname"
  dub build --build=release
}

package() {
  cd "$pkgname"

  install -Dm644 "bin/libxadi.so" "$pkgdir/usr/lib/libxadi.so"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
