# Maintainer: willemw <willemw12@gmail.com>

_pkgname=python-code-chat
pkgname=$_pkgname-git
pkgver=1.9.0.r5.g05f02b3
pkgrel=1
pkgdesc="Source code to HTML translator (literate programming)"
arch=('any')
url="https://github.com/bjones1/CodeChat"
license=('GPL3')
depends=('python-docutils')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

