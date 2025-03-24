# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=1.2.3
pkgrel=2
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=("python")
makedepends=("python-setuptools")
conflicts=("go-tools")
source=("eg-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('936d9ef89f62053df7f9a0b97cc13577bf5ae876b02c6c1dd499873a926d9504')
arch=("any")
options=(!emptydirs)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
