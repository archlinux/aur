# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=spicedb
pkgver=v1.45.3
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
source=("git+https://github.com/authzed/spicedb.git#commit=2aac899128bde57bc4b6cb94b2e68e7fdd3b815d")
sha256sums=('fb4e745c86c4ffcaf69589c85a9dace8c6dad817ccd8f4b2c264a09f35d110ab')

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" -v -o "$pkgname" "./cmd/$pkgname"
}

package() {
  install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

