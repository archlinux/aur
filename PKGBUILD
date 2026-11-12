# Maintainer: Athan Clark <athan dot clark at gmail dot com>

pkgname=ltext-bin
_pkgname=ltext
pkgver=0.2.1
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
sha256sums_x86_64=('8d7a34f5fb7ddbf0ddd82f9860850a0664450f4123ef63d4a4a5f999843d9470')
sha256sums_aarch64=('4a72796c3171ae24693120f0ba8a2ec76be8d602fcd2edcb43d1ae0c29f9738a')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 ltext -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
