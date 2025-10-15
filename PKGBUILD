# Maintainer: Clement Vassaux <locoxduturfu@gmail.com>
pkgname=kotofetch
pkgver=0.2.18
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
sha256sums=('5340709befbf5935342e4bf5942e75f09087c012019e8fd2a924108867db3899' 'SKIP' 'SKIP')
options=('!debug')

package() {
  cd "$srcdir"
  tar --strip-components=1 -xzf "kotofetch-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm755 "kotofetch" "$pkgdir/usr/bin/kotofetch"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
