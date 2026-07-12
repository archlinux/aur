# Maintainer: Mydayyy <dev@mydayyy.eu>

pkgname=pbcli
pkgver=2.10.0
pkgrel=1
pkgdesc="pbcli is a command line client which allows to upload and download pastes from privatebin directly from the command line."
arch=('x86_64')
url="https://github.com/Mydayyy/pbcli"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mydayyy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('57d7f08ebcfdef332cd7e228ff54b2201589fed3b9d0d579ca4edccfb3ce9607ececce63155571ab31d3f37a3678b61487aedff49323d0ef0e214fdaea593d38')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/pbcli" "$pkgdir/usr/bin/pbcli"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-UNLICENSE" "$pkgdir/usr/share/licenses/${pkgname}/UNLICENSE"
}
