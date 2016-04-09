
# Maintainer: jguer <joaogg3 at gmail dot com>

_pkgname=elementary-cursors
pkgname=$_pkgname-git
pkgver=r37.64440f1
pkgrel=1
pkgdesc="elementary project cursor theme"
arch=('any')
url="https://github.com/snwh/elementary-cursors"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=($pkgname::git://github.com/snwh/elementary-cursors.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
}

package() {
  cd $pkgname
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d  "$pkgdir/usr/share/icons/"
  cp -rp elementary* "$pkgdir/usr/share/icons/"
}

