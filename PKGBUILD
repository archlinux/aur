# Maintainer: Victor <v1c70rp at gmail dot com>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=thrust
pkgver=1.13.0
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
sha256sums=('f43306ae4230efdd78a8ce82fb10685676b27ce692777ee5c5a3361ced305d63'
            '8c8851bf1a7390cfb07183c3d4b3e55cebe818943b2daed8b338bd65ce70ce01')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ${pkgname} "${pkgdir}/opt/${pkgname}/"
  cp -r examples "${pkgdir}/opt/${pkgname}/"
  cd "${srcdir}/cub-${pkgver}"
  cp -r cub "${pkgdir}/opt/${pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
