# Maintainer: Athan Clark <athan dot clark at gmail dot com>

pkgname=ltext-bin
_pkgname=ltext
pkgver=0.2.0
pkgrel=1
pkgdesc='Text-file templating utility that treats files as higher-order functions (static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/ltext/ltext'
license=('BSD-3-Clause')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('2c27c0cd4326433bda83c1822f874925196f77e6fa565e5220ebb182c9189e44')
sha256sums_aarch64=('0b0ead5a5bf30fb3f2f7438cdc3723345372080f3ebc589604cc8caf232ee304')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 ltext -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
