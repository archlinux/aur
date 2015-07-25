# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=0.1.1
pkgrel=3
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=('python')
makedepends=('python-setuptools')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
# sha256sums=('83bc25bfcbe5a9bfd136587edf4b666feeee4e22c0e48d4a27e8bcfcacd5b63e')
source=("https://pypi.python.org/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/srsudar/${pkgname}/v${pkgver}/LICENSE.txt")
md5sums=('6e60ff29baa96902037dfbfd32b79f3d'
         '0ef25a9a8b81a77d44804af83c7d4717')
arch=('any')
options=(!emptydirs)

package() {
  mv LICENSE.txt ${srcdir}/LICENSE
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
  install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
