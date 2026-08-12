# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealql-language-server
pkgname=surrealql-language-server-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="SurrealQL language server for editor integration (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/surrealdb/surrealql-language-server"
license=('Apache-2.0')
depends=('libgcc')
provides=("surrealql-language-server=$pkgver")
conflicts=(surrealql-language-server)
source_x86_64=("$_pkgname-$pkgver-linux-amd64::https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_aarch64=("$_pkgname-$pkgver-linux-arm64::https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64")
sha256sums_x86_64=('f6cecf4e532b2c8e25ad370d001aa0aac4cfa5db1779d51601a9fa008a35f3a0')
sha256sums_aarch64=('7208f6ac8089065c04c77d76b30f7e0b30825bb9c96eec1024161a92fd015f1e')
options=('!debug')

package() {
  cd "$srcdir"

  case $CARCH in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
  esac

  install -Dm755 "$_pkgname-$pkgver-linux-$_arch" "$pkgdir/usr/bin/$_pkgname"
}
