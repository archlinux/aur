# Maintainer: Benjamin Chrétien <chretien dot b+arch at gmail dot com>
# Contributor: Soo-Hyun Yoo <yoos117@gmail.com>
pkgname=octomap
pkgver=1.7.0
pkgrel=1
pkgdesc="A probabilistic, flexible, and compact 3D mapping library for robotic systems."
arch=('i686' 'x86_64')
url="http://octomap.github.com/"
license=('New BSD License')
groups=()
depends=()
makedepends=('cmake')
provides=('octomap')
conflicts=('octomap-git')
source=("https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('c5f2f647465be92836697534dd4bb19a9185f541323e2fe09cfaa78cd1d9bf04')

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
