# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sugarjazy
pkgver=0.2.1
pkgrel=1
pkgdesc="Parse json logs nicely"
arch=('any')
url="https://github.com/chmouel/sugarjazy"
license=('Apache')
depends=('python-gobject' 'evolution-data-server')
source=( https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('acbb10331222ae12d4633494a0f303acf1a5b65db1ad95ba289148c048ea1758')
makedepends=("python-setuptools")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
