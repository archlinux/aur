# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sugarjazy
pkgver=0.4.0
pkgrel=1
pkgdesc="Parse json logs nicely"
arch=('any')
url="https://github.com/chmouel/sugarjazy"
license=('Apache')
depends=()
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('ec048ad12a7f8f814e35174bb44d39ed1e48c65e6d6dd1d7c0e7c175ab85b363')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
