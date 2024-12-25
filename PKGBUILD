# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=bright-nightly-bin
_pkgname=bright
pkgver=nightly
pkgrel=3
pkgdesc="Automatically adjust brightness based on configuration"
arch=('x86_64')
url="https://github.com/someoneonsmile/${_pkgname}"
license=('GPL2')
depends=()
makedepends=()
conflicts=()
_date="$(date -u +%Y%m%d)"
source=("${_pkgname}-${_date}.tar.gz::https://github.com/someoneonsmile/${_pkgname}/releases/download/nightly/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  # sha256sum ${pkgname}.tar.gz | cut -d ' ' -f 1
  cd "$srcdir/${_pkgname}-x86_64-unknown-linux-musl"
  ./${_pkgname} --version | cut -d ' ' -f 2
}

package() {
  cd "$srcdir/${_pkgname}-x86_64-unknown-linux-musl"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
