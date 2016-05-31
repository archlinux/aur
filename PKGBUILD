# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Note
# Unlike the releases of the other LXQt components this package can't be included
# into the official repositories right now as these lack its dependencies
# system-tools-backends and liboobs.

pkgname=lxqt-admin
pkgver=0.10.0
pkgrel=3
pkgdesc="LXQt system administration"
arch=("i686" "x86_64" "armv6h")
url='https://github.com/lxde/lxqt-admin'
license=("LGPL")
depends=("liblxqt" "liboobs")
makedepends=("cmake" "qt5-tools")
source=("https://github.com/lxde/lxqt-admin/releases/download/0.10.0/lxqt-admin-0.10.0.tar.xz"
        "https://github.com/lxde/lxqt-admin/releases/download/0.10.0/lxqt-admin-0.10.0.tar.xz.asc")
sha256sums=("46a5dd35e4bb560643647dfc9439f4a6ba1cdb3fd73af639cb3aca364cd3a895"
            "SKIP")
validpgpkeys=("169704C6FB490C6892C7F23C37E0AF1FDA48F373") # J. Leclanche

build() {
      mkdir -p build
      cd build
      LC_ALL=en_US.UTF-8 cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$pkgname-$pkgver"
      LC_ALL=en_US.UTF-8 make
}

package() {
      cd build
      make DESTDIR="$pkgdir" install
}
