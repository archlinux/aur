# Maintainer: Meowkate
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-qqmusic-git
_pkgname=feeluown-qqmusic
pkgver=r80.g4b21ae9
pkgrel=1
provides=('feeluown-qqmusic')
conflicts=('feeluown-qqmusic')
pkgdesc="feeluown qqmusic plugin"
arch=('any')
url="https://github.com/feeluown/${_pkgname}"
license=('GPL3')
depends=('feeluown-git' 'python-marshmallow' 'python-requests')
makedepends=('python-setuptools')
groups=('feeluown-full')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  python setup.py build
}

package() {
  cd ${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

