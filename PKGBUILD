# Maintainer: willemw <willemw12@gmail.com>

_pkgname=flatwoken-icons
pkgname=$_pkgname-git
pkgver=r636.6f826b0
pkgrel=1
pkgdesc="Flat, long-shadow icon themes derived from the AwOken Token-style iconset"
arch=('any')
url="https://github.com/alecive/FlatWoken"
license=('CCPL:by-sa-4.0')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/alecive/FlatWoken.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname/Extra

  # Set folder icon color
  #./configure.sh -f blue

  # Set panel icon color (icons in /usr/share/icons/FlatWoken/22x22/apps/)
  #./configure.sh -p \#646464
  #./configure.sh -p \#EEEEEE
}

package() {
  cd $pkgname
  install -d  "$pkgdir/usr/share/icons/"
  cp -rp FlatWoken* "$pkgdir/usr/share/icons/"
}

