# Maintainer: Ning Sun <n@sunng.info>
pkgname=zemon-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal system monitor for zellij written in Rust"
arch=('x86_64')
url="https://github.com/sunng87/zemon"
provides=('zemon')
license=('MIT')
depends=('glibc')
makedepends=('patchelf')
source=("$pkgname-$pkgver::https://github.com/sunng87/zemon/releases/download/v${pkgver}/zemon-linux-x86_64")
sha256sums=('198d29846e6b26aadd4818cdd734fb98b17cfa2e0718ce2e2b0b9c1a97a92e62')

package() {
  patchelf --set-interpreter /usr/lib64/ld-linux-x86-64.so.2 "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/zemon"
}
