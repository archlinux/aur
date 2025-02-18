# Maintainer: Mydayyy <dev@mydayyy.eu>

pkgname=pbcli
pkgver=2.7.1
pkgrel=1
pkgdesc="pbcli is a command line client which allows to upload and download pastes from privatebin directly from the command line."
arch=('x86_64')
url="https://github.com/Mydayyy/pbcli"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mydayyy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a3c70775e69676add11ac875fe2b54432f8a19ad6de86f3095c19bab9ca0ba17c772d28cfd755f303a77219b975d7832f2d2613c31990353e0e324950e223387')
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
