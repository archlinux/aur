# Maintainer: Clement Vassaux <locoxduturfu@gmail.com>
pkgname=kotofetch
pkgver=0.2.19
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
sha256sums=('ea976a382e508ca9c4c65c13673357516b302973290db3411f777829861f86fc'
            '99388dabed3ac24e7bb8eceff0228c246d0b7375ae201c5eb56bdeb68ab290c0'
            '643d1712d5f79ee7be967c755e59e2e9bf6fd5868cf368f99e6f4a83153564b8')
options=('!debug')

package() {
  cd "$srcdir"
  tar --strip-components=1 -xzf "kotofetch-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm755 "kotofetch" "$pkgdir/usr/bin/kotofetch"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
