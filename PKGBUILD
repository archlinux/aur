# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealql-language-server
pkgname=surrealql-language-server-bin
pkgver=0.6.0
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
sha256sums_x86_64=('27460b1b230a2de83242e0fe369f5faccc98e6ddbeda227abccf3642cabe00a8')
sha256sums_aarch64=('9053d9c62eee00336237e2c5080942f1bd35b96080249f331c9e4c82d6e18aa5')
options=('!debug')

package() {
  cd "$srcdir"

  case $CARCH in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
  esac

  install -Dm755 "$_pkgname-$pkgver-linux-$_arch" "$pkgdir/usr/bin/$_pkgname"
}
