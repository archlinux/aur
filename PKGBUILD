# Maintainer: Evan M Jones <evanjones4040@gmail.com>
pkgname=line
_pkgname=line
pkgver=1
pkgrel=1
epoch=1
pkgdesc="A dead simple line printer."
arch=('any')
url="https://github.com/mini-eggs/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'gcc')
source=("git+https://github.com/mini-eggs/line.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  make 
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/line/LICENSE"
  install -D -m755 line "$pkgdir/usr/bin/$_pkgname"
}

