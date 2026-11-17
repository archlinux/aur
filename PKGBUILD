# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealql-language-server
pkgname=surrealql-language-server-bin
pkgver=0.6.4
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
sha256sums_x86_64=('3010b952adeccc8c23f0ed88282fefcf041e3b271f028a370fb372905b92e09a')
sha256sums_aarch64=('db7d15c78bf63c4b914aab3740814f3dc00b26ed2dd80187c16b9827df378185')
options=('!debug')

package() {
  cd "$srcdir"

  case $CARCH in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
  esac

  install -Dm755 "$_pkgname-$pkgver-linux-$_arch" "$pkgdir/usr/bin/$_pkgname"
}
