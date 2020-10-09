# Maintainer: Victor <v1c70rp at gmail dot com>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=thrust
pkgver=1.10.0
pkgrel=1
pkgdesc='A C++ parallel programming library which resembles the C++ Standard Library'
arch=('any')
url="https://github.com/thrust/$pkgname"
license=('Apache')

optdepends=(
  'cuda: for CUDA backend'
  'openmp: for OMP backend'
  'intel-tbb: for TBB backend'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thrust/${pkgname}/archive/${pkgver}.tar.gz"
        "cub-${pkgver}.tar.gz::https://github.com/thrust/cub/archive/${pkgver}.tar.gz")
sha256sums=('8149b30eabbc9a2af5f038fb2b7f91070d4e01266377e0cd12e3af3feda93f8f'
            '8531e09f909aa021125cffa70a250761dfc247f960d7a1a12f65e6651ffb6477')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ${pkgname} "${pkgdir}/opt/${pkgname}/"
  cp -r examples "${pkgdir}/opt/${pkgname}/"
  cd "${srcdir}/cub-${pkgver}"
  cp -r cub "${pkgdir}/opt/${pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
