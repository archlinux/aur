# Maintainer: LinArcX <linarcx@gmail.com>

pkgname=tvdb3_api-git
pkgver=0.1
pkgrel=1
pkgdesc="easy to use interface to thetvdb.com(Python3)"
arch=('any')
url="https://github.com/dbr/tvdb_api"
license=('GPL')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=($pkgname)
conflicts=($pkgname)
source=($pkgname::git://github.com/dbr/tvdb_api.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

