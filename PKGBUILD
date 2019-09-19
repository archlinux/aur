# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
_pkgname=gdspy
pkgname=python-gdspy-git
pkgver=r461.d440538
pkgrel=1
pkgdesc="Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/heitzmann/gdspy"
arch=('x86_64')
license=('GPL3')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
replaces=('python-gdspy')
provides=('python-gdspy')
source=("git+https://github.com/heitzmann/gdspy")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --root=${pkgdir}
}

