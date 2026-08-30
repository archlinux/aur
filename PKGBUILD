# Maintainer: Hiro <31057166+HiroGitea@users.noreply.github.com>
pkgname=ksystemstats-infiniband
pkgver=1.0.1
pkgrel=1
pkgdesc="KDE System Monitor sensor plugin exposing InfiniBand port counters (RDMA-aware)"
arch=('x86_64' 'aarch64')
url="https://github.com/HiroGitea/ksystemstats-infiniband"
license=('GPL-2.0-or-later')
depends=('libksysguard' 'kcoreaddons' 'qt6-base')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73bdf821fad93894e8cdf4512bdb0779499ae1331dc79a61be6411978b99afc5')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
