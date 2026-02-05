# Maintainer: Ning Sun <n@sunng.info>
pkgname=zemon-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal system monitor for zellij written in Rust"
arch=('x86_64')
url="https://github.com/sunng87/zemon"
provides=('zemon')
license=('MIT')
depends=('glibc')
makedepends=('patchelf')
source=("https://github.com/sunng87/zemon/releases/download/v${pkgver}/zemon-linux-x86_64")
sha256sums=('7d0482e089b695d4c4d832a8f1471ea74628de73a52d69596a244b4e0676fd22')

package() {
  patchelf --set-interpreter /usr/lib64/ld-linux-x86-64.so.2 "$srcdir/zemon-linux-x86_64"
  install -Dm755 "$srcdir/zemon-linux-x86_64" "$pkgdir/usr/bin/zemon"
}
