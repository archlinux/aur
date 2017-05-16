# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=pgpointcloud-git
pkgver=20170516
pkgrel=1
pkgdesc="A PostgreSQL extension for storing point cloud (LIDAR) data"
arch=('i686' 'x86_64')
url="https://github.com/pgpointcloud/pointcloud"
license=(BSD)
makedepends=(cmake git laz-perf)
source=('git://github.com/pgpointcloud/pointcloud')
sha512sums=('SKIP')

build() {
  mkdir -p pointcloud/build
  cd pointcloud/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TESTS=FALSE ..
  make
}

package() {
  cd pointcloud/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
