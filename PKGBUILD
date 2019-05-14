# Maintainer: Evan M Jones <evanjones4040@gmail.com>

pkgname=line
pkgver=2
pkgrel=2
epoch=2
pkgdesc="A dead simple line printer."
arch=('any')
url="https://github.com/mini-eggs/${pkgname}"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('git' 'gcc')
source=("git+https://github.com/mini-eggs/line.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  make 
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/line/LICENSE"
  install -D -m755 line "$pkgdir/usr/bin/$pkgname"
}

