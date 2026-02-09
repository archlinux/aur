# Maintainer: Ning Sun <n@sunng.info>
pkgname=zemon-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A terminal system monitor for zellij written in Rust"
arch=('x86_64')
url="https://github.com/sunng87/zemon"
provides=('zemon')
license=('MIT')
depends=('glibc')
makedepends=('patchelf')
source=("$pkgname-$pkgver::https://github.com/sunng87/zemon/releases/download/v${pkgver}/zemon-linux-x86_64")
sha256sums=('32a51d30f5f7ff02c4d576d7d5bf3b95e097fe1bb8be9a98e1019a65dfa061c7')

package() {
  patchelf --set-interpreter /usr/lib64/ld-linux-x86-64.so.2 "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/zemon"
}
