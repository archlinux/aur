# Maintainer: Clement Vassaux <locoxduturfu@gmail.com>
pkgname=kotofetch
pkgver=0.2.16
pkgrel=1
pkgdesc="Minimalist fetch tool for Japanese quotes (written in Rust)"
arch=('x86_64')
url="https://github.com/hxpe-dev/kotofetch"
license=('MIT')
depends=('glibc')
makedepends=()
source=(
  "https://github.com/hxpe-dev/kotofetch/releases/download/v$pkgver/kotofetch-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  "https://raw.githubusercontent.com/hxpe-dev/kotofetch/v$pkgver/README.md"
  "https://raw.githubusercontent.com/hxpe-dev/kotofetch/v$pkgver/LICENSE"
)
sha256sums=('46b03ce4d4c09965e484f7a9a34dc4d39d3d6ac8c0e85ca9d6109dd79f4be2ed' '28ca0fe10b0634db024ccd9c8afbb3863fd59f4c0db29e84c3e84c8d8f6f9619' '643d1712d5f79ee7be967c755e59e2e9bf6fd5868cf368f99e6f4a83153564b8')
options=('!debug')

package() {
  cd "$srcdir"
  tar --strip-components=1 -xzf "kotofetch-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm755 "kotofetch" "$pkgdir/usr/bin/kotofetch"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
