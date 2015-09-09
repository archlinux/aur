# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=clockr
pkgname=clockr-git
pkgver=r2.8348d57
pkgrel=1
pkgdesc="simple curses clock written in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python')
makedepends=('git')
conflicts=('clockr')
source=('git://github.com/shaggytwodope/clockr.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
}
