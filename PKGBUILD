# Maintainer: Evan M Jones <evanjones4040@gmail.com>
pkgname=dlof
pkgver=1
pkgrel=1
epoch=1
pkgdesc="A dead simple unfolder -- opposite of fold."
arch=('any')
url="https://github.com/mini-eggs/${pkgname}"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('git' 'gcc')
source=("git+https://github.com/mini-eggs/dlof.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  make 
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/dlof/LICENSE"
  install -D -m755 dlof "$pkgdir/usr/bin/$pkgname"
}

