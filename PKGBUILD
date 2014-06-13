# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cub
pkgver=1.3.1
pkgrel=1
pkgdesc="A flexible library of cooperative threadblock primitives and other utilities for CUDA kernel programming."
arch=('any')
url='http://nvlabs.github.com/cub/'
license=('New BSD')
makedepends=('git')
optdepends=('cuda')

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/NVlabs/cub.git"#branch=${pkgver}
        "cub.pc")
sha1sums=('SKIP'
          'cbb2a588943a2a850205ab2e2a107fd74f9491a6')

package() {
  cd ${srcdir}

  # Install headers
  install -d "${pkgdir}/usr/include/cub"
  cp -r "${_dir}/cub" "${pkgdir}/usr/include"

  # Install pkg-config file
  install -Dm644 cub.pc "${pkgdir}"/usr/lib/pkgconfig/cub.pc
}
