# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.6.0
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'cmake' 'libxcb')
source=("https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(
  '02e14bcc51d83d89529a645b2a1efad18067025f991469f0746f3a17afc1eb6c1fa70f83e4052456efaaa4fa16809ae06759d7ae769e9b5c14b49a4933a46ef9'
)

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
