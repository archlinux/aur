# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=todofi-git
pkgver=20190407
pkgrel=1
pkgdesc="Handle your todo-txt tasks directly from Rofi"
arch=('any')
url="https://github.com/hugokernel/todofi.sh"
license=("unknown")
depends=('todotxt')
install=todofi.install
source=(git+https://github.com/hugokernel/todofi.sh)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}.sh
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  sed -i '/whereis/s/todo-txt/todo.sh/' $srcdir/todofi.sh/todofi.sh
  sed -i '/-p -d/s/todo-txt/todo.sh/' $srcdir/todofi.sh/todofi.sh
}

package() {
  install -Dm755 $srcdir/todofi.sh/todofi.sh $pkgdir/usr/bin/todofi.sh
}
