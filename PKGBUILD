# Maintainer: Mydayyy <dev@mydayyy.eu>

pkgname=pbcli
pkgver=2.2.1
pkgrel=1
pkgdesc="pbcli is a command line client which allows to upload and download pastes from privatebin directly from the command line."
arch=('x86_64')
url="https://github.com/Mydayyy/pbcli"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mydayyy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('83552166c3ebda4b8c923a78415cad0c4bef5a9e122cb09594ed146d22695023a783aab02e254f1028e7af126ddab6b3af88e842cd5fc552a836e85389f7fcc9')

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
