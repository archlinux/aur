# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.4.6
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-git')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('curl')
source=("fmp-linux::https://codeberg.org/lwilko/fmp/releases/download/v${pkgver}/fmp-linux")
sha512sums=('075ab22c04a307a38e396cbc03360f9158c1a93fea7fa6e1137bf4a454073c0a8416ee642da75940379c2b3b8551a6698eff624313b7944bb4607edfebef13e4')

build() {
  curl -fsSL https://codeberg.org/lwilko/fmp/src/branch/main/LICENSE > LICENSE
  curl -fsSL https://codeberg.org/lwilko/fmp/src/branch/main/README.md > README.md
}
package() {
  install -Dm755 "fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
