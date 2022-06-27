# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=1
pkgdesc="config manager (gun-stow like)"
arch=('x86_64')
url="https://github.com/someoneonsmile/${pkgname}"
license=('GPL2')
# depends=('coreutils')
makedepends=()
conflicts=()
source=("${pkgname}.tar.gz::https://github.com/someoneonsmile/${pkgname}/releases/download/nightly/${pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  sha256sum ${pkgname}.tar.gz | cut -d ' ' -f 1
}

package() {
  cd "$srcdir/${pkgname}-x86_64-unknown-linux-musl"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
