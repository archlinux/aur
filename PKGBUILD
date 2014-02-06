# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cub
pkgver=1.1.1
pkgrel=2
pkgdesc="A flexible library of cooperative threadblock primitives and other utilities for CUDA kernel programming."
arch=('any')
url='http://nvlabs.github.com/cub/'
license=('New BSD')
makedepends=('git')

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/NVlabs/cub.git"#branch=${pkgver}
        "cub.pc")
sha1sums=('SKIP'
          'e35f7b34520e7b8f540b446da69c71c200a3324c')

package() {
  cd ${srcdir}

  # Install headers
  install -d "${pkgdir}/usr/include/cub"
  cp -r "${_dir}/cub" "${pkgdir}/usr/include"

  # Install pkg-config file
  install -Dm644 cub.pc "${pkgdir}"/usr/lib/pkgconfig/cub.pc
}
