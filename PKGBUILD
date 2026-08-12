# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=unordered_dense
pkgver=4.9.0
pkgrel=1
pkgdesc="A fast & densely stored hashmap and hashset based on robin-hood backward shift deletion"
arch=(any)
url="https://github.com/martinus/unordered_dense"
license=(MIT)
makedepends=(
    cmake
    git
    )
source=("git+https://github.com/martinus/unordered_dense.git#tag=v${pkgver}")
sha256sums=('4a0e3378d1726c9c87403c82afbb793a87c45f3df3fc4828ec086e2a4c5df08f')

build() {
  local _flags=(

  )

  cmake -B build -S "unordered_dense" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 unordered_dense/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
