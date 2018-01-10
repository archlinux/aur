# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=habito
pkgver=1.0a2
pkgrel=1
pkgdesc="Simple commandline habits tracker."
url="https://github.com/codito/habito"
license=("MIT")
arch=("any")
provides=("habito")
makedepends=("python-setuptools")
depends=("python" "python-click" "python-peewee" "python-terminaltables")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("5a0acccf6ba9333729a531e4f8c50fcfd54a00f26f6aaa4a461a4b51f718d619661e267e1de60dbe964a9d91d2b0d0fd0283e2a634ac9d9839b79c5095cdca0d")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
