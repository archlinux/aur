# Maintainer: Samuel Walladge <samuel@swalladge.net>
pkgname=pc
pkgver=0.1.1
pkgrel=1
pkgdesc="Command line client for pastebins"
arch=('i686' 'x86_64')
url="https://sr.ht/~swalladge/pc/"
license=('GPL3')
makedepends=('cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~swalladge/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('446c5b905fea7efac45f2caf17fb11c947035818383f0b5c408d0cfcd7e00560')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

