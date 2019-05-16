# Maintainer: Evan M Jones <evanjones4040@gmail.com>
pkgname=diss
pkgver=1
pkgrel=1
epoch=1
pkgdesc="Coming soon."
arch=('any')
url="https://github.com/mini-eggs/${pkgname}"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('git' 'gcc')
source=("git+https://github.com/mini-eggs/diss.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  make 
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/diss/LICENSE"
  install -D -m755 diss "$pkgdir/usr/bin/$pkgname"
}

