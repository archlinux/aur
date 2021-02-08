# Maintainer: Eduard Gabriel (lexofficial29@protonmail.com)

pkgname=lexspec-git
_srcname=lexspec
provides=('lexspec')
conflicts=('lexspec')
pkgver=r40.b78283e
pkgrel=1
pkgdesc="Get system information in linux"
arch=('any')
url="https://github.com/lexofficial29/lexspec"
license=('GPLv2')
source=("git+https://github.com/lexofficial29/lexspec")
md5sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgdir"
  install -Dm644 "$srcdir"/"$_srcname"/lspec usr/bin/lspec
  chmod +x usr/bin/lspec
}
