# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-git' 'fmp-git-debug')
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
sha512sums=('23243dce6fe0b4f5dcb525c989655e61853a3d34306bbbf5ce914815e91634bebc49ce58f3308c213d6f0e1ade02a3db893f3cb6e2b864364f5d3c33203580b8' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "$srcdir/com.fmp.desktop" \
    "$pkgdir/usr/share/applications/com.fmp.desktop"

  install -Dm644 "$srcdir/com.fmp.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.fmp.svg"

  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
