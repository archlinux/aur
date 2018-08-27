# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mar-git
_gitname=mar
pkgver=2.0.2
pkgrel=4
pkgdesc='An intuitive syntax mass file renamer'
url='https://github.com/4w/mar'
arch=('any')
license=('GPL')
depends=('python')
makedepends=('git')
source=("git+https://gitlab.com/4w/mar.git" 'mar.1')
sha256sums=('SKIP'
            '6b6fe3691becdd9e7750a2bc9f71042fbe65adeb44a8af5c5d1cf136cb783256')

pkgver() {
  cd "$srcdir"/mar
  echo $(sed -n "s/^progversion = '\(.*\)'/\1/p" mar.py)
}

package() {
  cd "$srcdir"/mar
  install -Dm 755 mar.py "$pkgdir"/usr/bin/mar
  install -Dm 644 ../mar.1 "$pkgdir"/usr/share/man/man1/mar.1
}
