# Maintainer: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
_pkgname=sunxi-tools
pkgver=v1.1.r331.g1351c82
pkgrel=1
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=('any')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(git libusb)
conflicts=('sunxi-tools')
provides=()
source=('git+https://github.com/linux-sunxi/sunxi-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  PREFIX="$pkgdir/usr" make install
}
