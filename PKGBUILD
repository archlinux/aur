# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Benjamin Chrétien <chretien dot b+arch at gmail dot com>
# Contributor: Soo-Hyun Yoo <yoos117@gmail.com>

pkgname=octomap
pkgver=1.9.0
pkgrel=1
pkgdesc="A probabilistic, flexible, and compact 3D mapping library for robotic systems."
arch=('i686' 'x86_64')
url="http://octomap.github.com/"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
provides=('octomap')
conflicts=('octomap-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('5f81c9a8cbc9526b2e725251cd3a829e5222a28201b394314002146d8b9214dd')

build() {
  cd "$srcdir/octomap-$pkgver/octomap"
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/octomap-$pkgver/octomap"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim: ts=2 sw=2 et:
