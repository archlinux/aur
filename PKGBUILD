# Maintainer: Tolga HOŞGÖR <fasdfasdas@gmail.com>

pkgname=rapidjson-git
pkgver=r828.dd28719
pkgrel=2
pkgdesc="Rapidjson is an attempt to create the fastest JSON parser and generator."

arch=('any')
url="https://github.com/miloyip/rapidjson"
license=('GPL')
conflicts=('rapidjson')
provides=('rapidjson')
makedepends=('git')
source=('git+https://github.com/miloyip/rapidjson.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rapidjson"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  true # header-only library
}

package() {
  mkdir -p "$pkgdir/usr/include"
  cp -r "$srcdir/rapidjson/include/rapidjson" "$pkgdir/usr/include"
  find "$pkgdir/usr/include/rapidjson/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/include/rapidjson/" -type f -exec chmod 644 {} \;
}
