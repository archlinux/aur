# Maintainer: Carwin Young <carwinyoung+aur@gmail.com>
pkgname=ibus-ancient-git
pkgver=r11.399cba4
pkgrel=1
pkgdesc="ibus-compatible input methods and keyboards for ancient languages."
arch=(any)
url="https://github.com/emk/ibus-ancient"
license=('Unicode' 'UNLICENSE')
depends=('ibus' 'ibus-m17n' 'ibus-table')
makedepends=('git')
source=("git+https://github.com/emk/ibus-ancient.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  echo "$srcdir/${pkgname%-git}"
  cd "$srcdir/${pkgname%-git}"
  ./install.sh
}
