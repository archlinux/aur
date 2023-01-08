# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=habito
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple commandline habits tracker."
url="https://github.com/codito/habito"
license=("MIT")
arch=("any")
provides=("habito")
makedepends=("python-setuptools")
depends=("python>=3.5" "python-click" "python-peewee>=3.0.15" "python-terminaltables")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("78c39e1f18c8e0459001e6d7158886e403fc193c8c574063136df6e450e3308aeac4d4f70d57f4088caaaedf1be36717daec3dfab1feb89efb81708cf47c3ebd")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
