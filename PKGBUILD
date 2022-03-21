# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sugarjazy
pkgver=0.5.0
pkgrel=1
pkgdesc="Parse json logs nicely"
arch=('any')
url="https://github.com/chmouel/sugarjazy"
license=('Apache')
depends=()
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('88ef3f5536fb9824420ef8d7cd49af50d8236321471896afdad36dac253730e6')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
