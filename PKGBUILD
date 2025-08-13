# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://github.com/lwilk0/fmp"
conflicts=('fmp-git')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('curl')
source=("fmp-linux::https://github.com/lwilk0/fmp/releases/download/v${pkgver}/fmp-linux")
sha512sums=('34db83ad3a23e41c738b206df021500b81b02c2a31b29ab574052a6f94ef3fe8dbbed722b50ddccf6e1bfdedefb6c256fc1091715a14824254253ef935f29d6e')

build() {
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/LICENSE > LICENSE
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/README.md > README.md
}
package() {
  install -Dm755 "fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
