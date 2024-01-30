pkgname=fireurl
pkgver=0.2.0
pkgrel=1
pkgdesc="Fixing the firejail URL open issue"
arch=('x86_64')
url="https://github.com/rusty-snake/fireurl"
license=('MIT')
depends=('firejail')
makedepends=('cargo')
source=("https://github.com/rusty-snake/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eeaa7c9d46156aac8c9de490133bae774ca874c972ac284af7c6beec20ea2262')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 target/release/fireurl $pkgdir/usr/bin/fireurl
  install -Dm0755 target/release/fireurld $pkgdir/usr/bin/fireurld
}
