# Maintainer: Tolga HOŞGÖR <fasdfasdas@gmail.com>

_gitname=rapidjson
pkgname=rapidjson-git
pkgver=r1887.fcd263c6
pkgrel=1
pkgdesc="Rapidjson is an attempt to create the fastest JSON parser and generator."

arch=('any')
url="https://github.com/miloyip/rapidjson"
license=('GPL')
conflicts=('rapidjson')
provides=('rapidjson')
makedepends=('git')
source=("git+https://github.com/miloyip/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/include"
  cp -r "$srcdir/$_gitname/include/rapidjson" "$pkgdir/usr/include"
  find "$pkgdir/usr/include/rapidjson/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/include/rapidjson/" -type f -exec chmod 644 {} \;
}
