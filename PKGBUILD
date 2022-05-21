# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=1
pkgdesc="config manager (simple impl of gun-stow)"
arch=('x86_64')
url="https://github.com/someoneonsmile/stow"
license=('GPL2')
depends=('gcc-libs')
makedepends=()
conflicts=('stow')
source=("${pkgname}.tar.gz::https://github.com/someoneonsmile/stow/releases/download/${pkgver}/stow-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  printf "nightly"
}

package() {
  cd "$srcdir/stow-x86_64-unknown-linux-musl"
  install -Dm755 "stow" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
