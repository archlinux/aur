# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.7.1
pkgrel=2
pkgdesc="A simple TV show episode reminder"
arch=('any')
url="http://code.ott.net/projects/episoder"
license=('GPL2')
depends=('python2-pysqlite'
         'python2-yaml'
         'python2-beautifulsoup3'
         'python2-sqlalchemy'
         'tvdb_api')
source=(https://github.com/cockroach/episoder/archive/v0_7_1.tar.gz)
sha256sums=('4f2dd725ddfcade83ae01d59b1120fd0a191912665eb0182cca3d59c21d09418')

build() {
  cd "$srcdir/$pkgname-${pkgver//./_}"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//./_}"
  python2 setup.py install --root="${pkgdir}"
}
