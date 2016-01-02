# Maintainer: willemw <willemw12@gmail.com>

_pkgname=python-code-chat
pkgname=$_pkgname-git
pkgver=1.2.1.r0.g6c15264
pkgrel=1
pkgdesc="Source code to HTML translator (literate programming)"
arch=('any')
url="https://github.com/bjones1/CodeChat"
license=('GPL3')
depends=('python-docutils')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/bjones1/CodeChat.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

