# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=aurget
pkgver=4.8.0
pkgrel=1
pkgdesc="A simple, Pacman-like AUR helper"
arch=('any')
url="https://codeberg.org/pbrisbin/$pkgname"
license=('GPL')
source=("https://codeberg.org/pbrisbin/$pkgname/releases/download/v${pkgver//_/-}/aurget-${pkgver//_/-}.tar.gz")
optdepends=('customizepkg: for auto-customizing packages')

package() {
  cd "$pkgname-${pkgver//_/-}" || exit 1

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('09fd696cf16faf72375ed26a1104c90e')
