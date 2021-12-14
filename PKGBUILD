# Maintainer: Victor <v1c70rp at gmail dot com>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=thrust
pkgver=1.15.0
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
sha256sums=('0eeaf5a77cd7cb143f3443bd96b215ae1c4eacf18a712762e6a5c85213f80cc2'
            '1781ee5eb7f00acfee5bff88e3acfc67378f6b3c24281335e18ae19e1f2ff685')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ${pkgname} "${pkgdir}/opt/${pkgname}/"
  cp -r examples "${pkgdir}/opt/${pkgname}/"
  cd "${srcdir}/cub-${pkgver}"
  cp -r cub "${pkgdir}/opt/${pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
