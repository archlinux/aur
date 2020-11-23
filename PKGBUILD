# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls-server
pkgver=0.18.0
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
source=("https://pypi.io/packages/source/m/mtls-server/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('20f116079c21cca29679919ba7dd6ec3037b85cebfdb1bd27ce213a56de9aa5f'
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
