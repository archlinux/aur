# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.7.2
pkgrel=1
pkgdesc="A simple TV show episode reminder"
arch=('any')
url="https://github.com/cockroach/episoder"
license=('GPL2')
depends=('python2-pysqlite'
         'python2-yaml'
         'python2-sqlalchemy'
         'tvdb_api')
source=(https://github.com/cockroach/${pkgname}/archive/v${pkgver//./_}.tar.gz)
sha256sums=('9bc1f5949544b8f28c4c25b9f649aea6ce7c27ab990ca8e17ab250e9a7c80190')

build() {
  cd "$srcdir/$pkgname-${pkgver//./_}"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//./_}"
  python2 setup.py install --root="${pkgdir}"
}
