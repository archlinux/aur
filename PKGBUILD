# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls-server
pkgver=0.20.0
pkgrel=1
pkgdesc="A Web of Trust Short-Lived Client Certificate System (Server)"
url="https://github.com/drgrove/mtls-server"
license=("Apache")
arch=("any")
depends=("python-flask"
         "python-jinja"
         "python-cryptography"
         "python-gnupg"
         "python-psycopg2")
makedepends=("python-setuptools" "python-setuptools-scm")
source=("https://github.com/drGrove/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('06eeb79b914cd89809253f3b10d8a7d3df0bc2c1fc406a05455d857eb5280639'
            'SKIP')
validpgpkeys=('C92FE5A3FBD58DD3EC5AA26BB10116B8193F2DBD') # Danny Grove <dgrove@hashbang.sh>

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
