# Maintainer: David Pedersen <limero@me.com>
pkgname=scli-git
pkgver=r11.faf5ca2
pkgrel=1
pkgdesc="scli is a simple terminal user interface for Signal"
arch=("i686" "x86_64")
url="https://github.com/isamert/scli"
license=("GPL")
depends=("python-urwid" "signal-cli")
makedepends=("git")
optdepends=(
  "qrencode: Generate QR codes for linking device"
)
provides=("scli")
conflicts=("scli")
source=("${pkgname%-*}::git+git://github.com/isamert/${pkgname%-*}.git")
sha1sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
}
