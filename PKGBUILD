# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.7.3
pkgrel=1
pkgdesc="A simple TV show episode reminder"
arch=('any')
url="https://github.com/cockroach/episoder"
license=('GPL2')
depends=('python2-pysqlite'
         'python2-yaml'
         'python2-sqlalchemy'
         'tvdb_api')
source=(https://github.com/cockroach/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('57f4c1fb9833f434d2f31220810386f484b5ce147fb99250950c83b9ebe152de')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
