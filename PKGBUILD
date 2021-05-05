# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Roberto Rossini ("robymetallo") <roberros@insert_university_of_oslo_domain.no>

pkgname=raxml-ng
pkgver=1.0.2
_commit=411611611793e53c992717d869ca64370f2e4789
pkgrel=1
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion"
url='https://github.com/amkozlov/raxml-ng'
arch=('x86_64')
license=('AGPL3')
depends=('gcc-libs')
makedepends=('bison' 'cmake' 'flex' 'git' 'gmp')
checkdepends=('gmock' 'gtest')
source=("https://github.com/amkozlov/raxml-ng/releases/download/${pkgver}/raxml-ng_v${pkgver}_linux_x86_64_MPI.zip")
sha256sums=('6244256472691a099975aaa3ed9b0c872a4401d9a9e0cce95e9ab543119926c9')

prepare() {
    cd "${srcdir}"
}

package() {
  cd "${srcdir}"
  ./install.sh
  install -Dm755 "${srcdir}/bin/raxml-ng-mpi" "${pkgdir}/usr/bin/${pkgname}"
}
