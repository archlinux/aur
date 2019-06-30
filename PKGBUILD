# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
pkgver=1.1.r440.g42ffc5f
pkgrel=1
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/linux-sunxi/sunxi-tools"
license=(GPL)
depends=(libusb)
makedepends=(git)
conflicts=(sunxi-tools)
provides=(sunxi-tools)
source=("git+https://github.com/linux-sunxi/sunxi-tools.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  PREFIX="$pkgdir/usr" make install
}
