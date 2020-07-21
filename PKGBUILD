# Maintainer: Victor <v1c70rp at gmail dot com>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=thrust
pkgver=1.9.10
pkgrel=2
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
sha256sums=('5071c995a03e97e2bcfe0c5cc265330160316733336bb87dfcea3fc381065316'
            '2bd7077a3d9741f0689e6c1eb58c6278fc96eccc27d964168bc8be1bc3a9040f')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ${pkgname} "${pkgdir}/opt/${pkgname}/"
  cp -r examples "${pkgdir}/opt/${pkgname}/"
  cd "${srcdir}/cub-${pkgver}"
  cp -r cub "${pkgdir}/opt/${pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
