# Maintainer: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
_pkgname=sunxi-tools
pkgver=v1.1.r225.g9bf1de0
pkgrel=1
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(git libusb)
conflicts=()
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
