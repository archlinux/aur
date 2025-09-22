# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=spicedb
pkgver=v1.45.4
pkgrel=1
pkgdesc="Open Source, Google Zanzibar-inspired database for scalably storing and querying fine-grained authorization data"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/authzed/$pkgname"
license=('Apache-2.0')
depends=()
makedepends=(git go)
optdepends=()
provides=("$pkgname")
validpgpkeys=(968479a1aff927e37d1a566bb5690eeebb952194)
source=("git+https://github.com/authzed/spicedb.git#commit=4ff0d47bd4095f24fe2e11606d3ba7c7f9fad93c")
sha256sums=('6e688bc80f6f05dd5d95437d480d9fda492d23586a10d928e210cdd5dae1c6f9')

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" -v -o "$pkgname" "./cmd/$pkgname"
}

package() {
  install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

