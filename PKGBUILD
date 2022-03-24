# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sugarjazy
pkgver=0.6.2
pkgrel=1
pkgdesc="Parse json logs nicely"
arch=('any')
url="https://github.com/chmouel/sugarjazy"
license=('Apache')
depends=()
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('036d2d519a35dd166460533d9cc806c94607a9a7dad3bd0b1808075f0d3fee34')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
