# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=feeluown-netease-git
pkgver=r50.cfdcd13
pkgrel=1
pkgdesc="feeluown netease plugin git"
arch=('any')
url="https://github.com/feeluown/feeluown-netease"
license=('GPL3')
depends=('feeluown' 'python-pycryptodome' 'python-requests' 'python-marshmallow' 'python-beautifulsoup4')
makedepends=('git' 'python-setuptools' 'python-pip')
conflicts=('feeluown-netease')
provides=('feeluown-netease')
source=("git+https://github.com/feeluown/feeluown-netease.git")
sha512sums=('SKIP')

pkgver() {
    cd feeluown-netease
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd feeluown-netease
  python setup.py build
}

package() {
  cd feeluown-netease
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
