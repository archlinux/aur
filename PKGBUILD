# Maintainer:  AppleBloom <rat.o.drat@gmail.com> 

_pkgname="python2-zerorpc"
pkgname="$_pkgname-git"
pkgver=r199.82dcbc2
pkgrel=1
pkgdesc="An easy to use, intuitive, and cross-language RPC - python binding."
arch=('any')
license=('MIT')
url='http://www.zerorpc.io/'
depends=('python2-pyzmq')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/0rpc/zerorpc-python.git")
sha256sums=('SKIP')

_srcdir="zerorpc-python"

pkgver() {
  cd $_srcdir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_srcdir
  python2 setup.py install --root="$pkgdir" --optimize=1
}
