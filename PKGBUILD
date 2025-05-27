# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=simracing-hwdb
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
source=(
  git+https://github.com/JacKeTUs/$_reponame
)
sha256sums=(
  'SKIP'
)

package() {
  cd "$srcdir/$_reponame"
  install -m644 ./*.hwdb $pkgdir/usr/lib/udev/hwdb.d/
}

post_install() {
  systemd-hwdb update
}
