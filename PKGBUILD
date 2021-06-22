# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgname=python-tvdb_api-git
pkgver=3.1.r2.gd2705e6
pkgrel=1
pkgdesc="Easy to use interface to thetvdb.com"
arch=('any')
url="https://github.com/dbr/tvdb_api"
license=('GPL')
depends=('python-requests-cache')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
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

