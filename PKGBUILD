# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=yona-bin
pkgver=0.1.2
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
sha256sums=('da9275426ab98575d4d9026819d391e9ad35a065ed7a615acb9e30ac9c4332e1')

package() {
  cd "yona-${pkgver}-linux-x86_64"
  install -Dm755 bin/yonac "$pkgdir/usr/bin/yonac"
  install -Dm755 bin/yona "$pkgdir/usr/bin/yona"
  install -d "$pkgdir/usr/lib/yona"
  cp -a lib runtime src include "$pkgdir/usr/lib/yona/"
}
