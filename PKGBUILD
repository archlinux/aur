# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=bright-nightly-bin
_pkgname=bright
pkgver=nightly
pkgrel=1
pkgdesc="Automatically adjust brightness based on configuration"
arch=('x86_64')
url="https://github.com/someoneonsmile/bright"
license=('GPL2')
depends=()
makedepends=()
conflicts=()
source=("${pkgname}.tar.gz::https://github.com/someoneonsmile/${_pkgname}/releases/download/nightly/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  sha256sum ${pkgname}.tar.gz | cut -d ' ' -f 1
}

package() {
  cd "$srcdir/stow-x86_64-unknown-linux-musl"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
