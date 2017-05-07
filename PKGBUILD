# Maintainer: Sara Jakša <sarajaksa@gmail.com>
# Based on willemw <willemw12@gmail.com> build for python-code-chat

_pkgname=python-stackapi
pkgname=$_pkgname-git
pkgver=0.1.8
pkgrel=1
pkgdesc="A python wrapper for the StackOverflow and StackExchange API"
arch=('any')
url="https://github.com/AWegnerGitHub/stackapi"
license=('MIT')
depends=('python-docutils' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/AWegnerGitHub/stackapi.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}


