# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>

_pkgname=qutepart
pkgname=qutepart-git
pkgver=2.2.2.r0.g184909f
pkgrel=2
pkgdesc="Code editor component for PyQt and Pyside"
arch=('any')
url="https://github.com/hlamer/qutepart/"
license=('LGPL')
makedepends=('git' 'python2-setuptools')
depends=('python2-pyqt4')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/hlamer/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  # Qutepart test application
#  sed -i 's/env python[ ]*$/env python2/' editor.py
#}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

