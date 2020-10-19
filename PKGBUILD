# Maintainer: willemw <willemw12@gmail.com>

pkgname=flatwoken-icons-git
pkgver=r669.aa7b4a4
pkgrel=3
pkgdesc="Flat, long-shadow icon themes derived from the AwOken Token-style iconset"
arch=('any')
url="https://github.com/alecive/FlatWoken"
license=('CCPL:by-sa-4.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
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
  install -dm755 "$pkgdir/usr/share/icons/"
  cp -a FlatWoken* "$pkgdir/usr/share/icons/"
}

