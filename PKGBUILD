# Maintainer: Athan Clark <athan dot clark at gmail dot com>

pkgname=ltext-bin
_pkgname=ltext
pkgver=0.2.2
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
sha256sums_x86_64=('1652196566bf12f10ec61de3f728ea8baace2c70acaed7598d4984fb5c7f8380')
sha256sums_aarch64=('0dc7273d8c70f3672a41a02cbe83fe00ea496e5b5a8ad7664b6b365f1415fd1b')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 ltext -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
