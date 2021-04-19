# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=1.2.1
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=("python")
makedepends=("python-setuptools")
source=("eg-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('deb79ec8e0a3116285744c047f179b47cf52059bad7b468d1319e22ed0f52e74')
arch=("any")
options=(!emptydirs)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
