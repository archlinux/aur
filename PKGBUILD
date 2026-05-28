# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealql-language-server
pkgname=surrealql-language-server-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="SurrealQL language server for editor integration (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/surrealdb/surrealql-language-server"
license=('Apache-2.0')
depends=()
provides=(surrealql-language-server)
conflicts=(surrealql-language-server)
source_x86_64=("$_pkgname-$pkgver-linux-amd64::https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_aarch64=("$_pkgname-$pkgver-linux-arm64::https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64")
sha256sums_x86_64=('9935ba74e79169e4f739e5b40aec3c48e5fd5c4ba3a7f2103b7052bbb48cbcda')
sha256sums_aarch64=('504a0edc3a5f9d35823b11c5c4cb2fac849a2492a4c40e15e36f80f0cf47a31a')
options=('!debug')

package() {
  cd "$srcdir"

  case $CARCH in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
  esac

  install -Dm755 "$_pkgname-$pkgver-linux-$_arch" "$pkgdir/usr/bin/$_pkgname"
}
