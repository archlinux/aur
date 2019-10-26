# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=1.1.1
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=("python")
makedepends=("python-setuptools")
source=("eg-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('99020af6ff24742b3eb93a15a289f36156fdb93abdbec50b614b982b1ba9c399')
arch=("any")
options=(!emptydirs)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
