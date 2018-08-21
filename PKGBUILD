# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=1.1.0
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=("python")
makedepends=("python-setuptools")
source=("eg-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('41316c79e8f7a999e82057ac54c6d57c58a50cd37dc91e172b634998f61b1b86')
arch=("any")
options=(!emptydirs)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
