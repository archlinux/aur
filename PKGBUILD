# Maintainer: Mydayyy <dev@mydayyy.eu>

pkgname=pbcli
pkgver=2.5.0
pkgrel=1
pkgdesc="pbcli is a command line client which allows to upload and download pastes from privatebin directly from the command line."
arch=('x86_64')
url="https://github.com/Mydayyy/pbcli"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mydayyy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3adc2bb050ff7279c01b8cd8ba9695d0c91869a8a09f7fa4e506c3edb1117244c761335bdaddc2ccb37ce2df2179d288c4001547f198f6446ae18c008fe05e2e')
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
