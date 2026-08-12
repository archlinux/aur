# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=unordered_dense
pkgver=4.9.1
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
sha256sums=('cc16619c151f669caeb057354a27481024630480bc00a0a552285042e89e804b')

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
