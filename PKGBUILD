# Maintainer: Mydayyy <dev@mydayyy.eu>

pkgname=pbcli
pkgver=2.1.0
pkgrel=1
pkgdesc="pbcli is a command line client which allows to upload and download pastes from privatebin directly from the command line."
arch=('x86_64')
url="https://github.com/Mydayyy/pbcli"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mydayyy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('881738952883af7a450bb0e4a31207de4fb80116b976042c7e970700e9763eb6142ae4b130b04d81dc89cdfbe41d8e278f3c1ae37eca83ad0bc9f5e08bd7c62f')

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
