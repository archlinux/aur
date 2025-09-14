# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-git')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('curl')
source=(
  "fmp-linux::https://codeberg.org/lwilko/fmp/releases/download/v${pkgver}/fmp-linux"
  "com.fmp.desktop::https://codeberg.org/lwilko/fmp/raw/branch/main/data/com.fmp.desktop"
  "com.fmp.svg::https://codeberg.org/lwilko/fmp/raw/branch/main/data/com.fmp.svg"
  "LICENSE::https://codeberg.org/lwilko/fmp/raw/branch/main/LICENSE"
  "README.md::https://codeberg.org/lwilko/fmp/raw/branch/main/README.md"
)
sha512sums=('abe00aa8ae2165311896fc3f6ae338b5670ac64d5f330c0cd5abe362c192fd2c1ae23e8a8072864dcf14e8d6d5df8e5de1d0aed236e28993c58cbde2247a1695' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "$srcdir/com.fmp.desktop" \
    "$pkgdir/usr/share/applications/com.fmp.desktop"

  install -Dm644 "$srcdir/com.fmp.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.fmp.svg"

  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
