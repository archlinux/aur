# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output
pkgver=1.0.7
pkgrel=1
pkgdesc="OBS Studio plugin: Branch Output filter (per-source/scene streaming & recording)"
arch=('x86_64' 'aarch64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('cmake' 'ninja' 'git' 'gcc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OPENSPHERE-Inc/branch-output/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('de8966d8f2cbef19dd4590dcb69db6009ba54fe14608f7966976d0280b9ef280930b451f4f9930da4f335b36aff55b5193e9b803371947d3bdfaac8705d89eba')

build() {
  cmake -S "branch-output-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
