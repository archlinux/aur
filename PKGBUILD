# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=yona-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Yona programming language compiler targeting LLVM"
arch=('x86_64')
url="https://github.com/yona-lang/yonac-llvm"
license=('GPL-3.0-only')
depends=('llvm-libs' 'clang' 'lld' 'pcre2')
provides=('yona')
conflicts=('yona')
options=('!strip')
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/yona-lang/yonac-llvm/releases/download/v$pkgver/yona-$pkgver-linux-x86_64.tar.gz")
sha256sums=('1f612828585237e78e503e751cdcd6be2c2feb459e5fb23142c0912e2aac4143')

package() {
  cd "yona-${pkgver}-linux-x86_64"
  install -Dm755 bin/yonac "$pkgdir/usr/bin/yonac"
  install -Dm755 bin/yona "$pkgdir/usr/bin/yona"
  install -d "$pkgdir/usr/lib/yona"
  cp -a lib runtime src include "$pkgdir/usr/lib/yona/"
}
