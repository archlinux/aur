# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>

_pkgname=qutepart
pkgname=qutepart-git
pkgver=2.2.3.r18.gd938532
pkgrel=1
pkgdesc="Code editor component for PyQt and Pyside"
arch=('any')
url="https://github.com/hlamer/qutepart/"
license=('LGPL')
makedepends=('git' 'python-setuptools')
depends=('python-pyqt5')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/hlamer/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

