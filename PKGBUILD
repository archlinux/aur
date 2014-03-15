# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=cub
pkgver=1.2.2
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
          '1da49bb3434a79a7dd7c36620725f60537a01bb1')

package() {
  cd ${srcdir}

  # Install headers
  install -d "${pkgdir}/usr/include/cub"
  cp -r "${_dir}/cub" "${pkgdir}/usr/include"

  # Install pkg-config file
  install -Dm644 cub.pc "${pkgdir}"/usr/lib/pkgconfig/cub.pc
}
