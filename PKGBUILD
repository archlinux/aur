# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=habito
pkgver=1.0a5
pkgrel=1
pkgdesc="Simple commandline habits tracker."
url="https://github.com/codito/habito"
license=("MIT")
arch=("any")
provides=("habito")
makedepends=("python-setuptools")
depends=("python" "python-click" "python-peewee>=3.0.15" "python-terminaltables")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("a4e1c1d6e0e8fe3023c90e808e1a9828df346dbcc90493e4656d328a58a65a3f4819f95be4baa7e1b38928eac5754d7ca4799e38c03f6953ac78b255891bc4da")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
