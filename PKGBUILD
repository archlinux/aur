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
sha512sums=('0a67b3abcbe598c81a800ebc381025f9ab2fd430b2575372be0f502e2af4e0b6825a8b369e02c511b39f95b0df819748446b7c6fe4e71fb67a1a06a6eb67797b')

build() {
  curl -fsSL https://codeberg.org/lwilko/fmp/src/branch/main/LICENSE > LICENSE
  curl -fsSL https://codeberg.org/lwilko/fmp/src/branch/main/README.md > README.md
}
package() {
  install -Dm755 "fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
