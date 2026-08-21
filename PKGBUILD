# Maintainer: Adam Kovari <adam@kovari.eu>
pkgname=yona-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Yona programming language compiler targeting LLVM"
arch=('x86_64')
url="https://github.com/yona-lang/yona"
license=('GPL-3.0-only')
depends=('llvm-libs' 'clang' 'lld' 'pcre2')
provides=('yona')
conflicts=('yona')
options=('!strip')
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/yona-lang/yona/releases/download/v$pkgver/yona-$pkgver-linux-x86_64.tar.gz")
sha256sums=('2132178b2d9c96acd0de99930a6f4f912a8e8fe0560d0c1788e5e5fd1225b757')

package() {
  cd "yona-${pkgver}-linux-x86_64"
  install -Dm755 bin/yonac "$pkgdir/usr/bin/yonac"
  install -Dm755 bin/yona "$pkgdir/usr/bin/yona"
  install -Dm755 bin/yona-repl "$pkgdir/usr/bin/yona-repl"
  install -Dm755 bin/yls "$pkgdir/usr/bin/yls"
  install -d "$pkgdir/usr/lib/yona"
  cp -a lib runtime src include "$pkgdir/usr/lib/yona/"
}
