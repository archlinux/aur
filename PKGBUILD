# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
pkgname=simracing-hwdb-git
pkgver=1.0
pkgrel=1
pkgdesc="Collection of hwdb entries for various simracing equipment to fix detection in games/proton"
arch=('any')
url="https://github.com/JacKeTUs/simracing-hwdb"
license=('GPL2')
depends=(
  systemd
)
makedepends=(
  git
)

package() {
  install -m644 $srcdir/*.hwdb /usr/lib/udev/hwdb.d/
}

post_install() {
  systemd-hwdb update
}
