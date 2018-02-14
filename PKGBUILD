# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=habito
pkgver=1.0a4
pkgrel=1
pkgdesc="Simple commandline habits tracker."
url="https://github.com/codito/habito"
license=("MIT")
arch=("any")
provides=("habito")
makedepends=("python-setuptools")
depends=("python" "python-click" "python-peewee" "python-terminaltables")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("9f93ad66864c727b2804a70bd043d4829a9ce8dda32b8c6b6076775dae3ca6834f32cd614d925c4bf34f15d2b909f1675727cbaff53240efeec1753afcb7bf65")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
