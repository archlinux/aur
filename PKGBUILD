# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Clément Démoulins <clement@archivel.fr>

_pkgname=python-tvdb_api
pkgname=$_pkgname-git
pkgver=1.9.r25.g8f34a0d
pkgrel=1
pkgdesc="Easy to use interface to thetvdb.com"
arch=('any')
url="https://github.com/8cylinder/tv-overlord"
license=('GPL')
depends=('python-requests-cache')
makedepends=('git' 'python-setuptools')
provides=($_pkgname 'tvdb_api')
conflicts=($_pkgname 'tvdb_api')
source=($_pkgname::git://github.com/dbr/tvdb_api.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

