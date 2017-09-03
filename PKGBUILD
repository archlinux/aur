# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=1.0.1
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=("python")
makedepends=("python-setuptools")
source=("eg-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('b52aa86a2b2d018c17bb99637c07e9f42f53fdf8890ef2beaaa774a425350ac4')
arch=("any")
options=(!emptydirs)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
