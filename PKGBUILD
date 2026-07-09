# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealql-language-server
pkgname=surrealql-language-server-bin
pkgver=0.2.0
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
sha256sums_x86_64=('7419cbdf156dc455ef40fbc8137ba91b014d2aa5fe23d8f4e7717360e74dec3d')
sha256sums_aarch64=('73ad40e0fdfcfae6c8d4433647092d8c43d2a053426eb71b299716f6d716856d')
options=('!debug')

package() {
  cd "$srcdir"

  case $CARCH in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
  esac

  install -Dm755 "$_pkgname-$pkgver-linux-$_arch" "$pkgdir/usr/bin/$_pkgname"
}
