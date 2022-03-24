# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sugarjazy
pkgver=0.6.1
pkgrel=1
pkgdesc="Parse json logs nicely"
arch=('any')
url="https://github.com/chmouel/sugarjazy"
license=('Apache')
depends=()
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('bcec04267bbabae460ae35a252d31d1b48a85ed795a28684f12260b66835091d')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
