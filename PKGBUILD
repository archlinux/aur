# Maintainer: Victor <v1c70rp at gmail dot com>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=thrust
pkgver=1.16.0
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
sha256sums=('93b9553e3ee544e05395022bea67e6d600f8f3eb680950ec7cf73c0f55162487'
            '271dc42d0a7ab3bd311eefa4ba8fd19f99ec093cf5e9053426f358914c8983d6')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ${pkgname} "${pkgdir}/opt/${pkgname}/"
  cp -r examples "${pkgdir}/opt/${pkgname}/"
  cd "${srcdir}/cub-${pkgver}"
  cp -r cub "${pkgdir}/opt/${pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
