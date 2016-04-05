# Maintainer:  AppleBloom <rat.o.drat@gmail.com> 

_pkgname="python2-commentjson"
pkgname="$_pkgname-git"
pkgver=r25.1b61eb5
pkgrel=1
pkgdesc="Add JavaScript or Python style comments in JSON."
arch=('any')
license=('MIT')
url='https://github.com/ethifus/commentjson'
depends=('python2')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/ethifus/commentjson.git")
sha256sums=('SKIP')

_srcdir="commentjson"

pkgver() {
  cd $_srcdir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_srcdir
  python2 setup.py install --root="$pkgdir" --optimize=1
}
