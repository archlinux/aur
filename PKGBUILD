# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=habito
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple commandline habits tracker."
url="https://github.com/codito/habito"
license=("MIT")
arch=("any")
provides=("habito")
makedepends=("python-setuptools")
depends=("python" "python-click" "python-peewee>=3.0.15" "python-terminaltables")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("e41ccc9a9daa912ec0121cad3bff1075030937d5c91a972446514c3ee8cc53099f6bcbb5f8333111177e74ebd1c99303a6728ba879034a11029a2f31ed7f3a12")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
