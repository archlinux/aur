# Maintainer: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.7.0
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
source=(https://code.ott.net/attachments/download/25/episoder-0.7.0.tar.gz)
sha256sums=('8855ecf670e4e5c6d4c5b3c42a6854c689e87c5c1d06c1a77952cc6f67843471')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
