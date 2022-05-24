# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=1
pkgdesc="config manager (simple impl of gun-stow)"
arch=('x86_64')
url="https://github.com/someoneonsmile/stow"
license=('GPL2')
# depends=('coreutils')
makedepends=()
conflicts=('stow')
source=("${pkgname}.tar.gz::https://github.com/someoneonsmile/stow/releases/download/nightly/stow-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  sha256sum ${pkgname}.tar.gz | cut -d ' ' -f 1
}

package() {
  cd "$srcdir/stow-x86_64-unknown-linux-musl"
  install -Dm755 "stow" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
