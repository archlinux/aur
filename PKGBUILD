pkgname=colorize-git
_gitname=colorize
pkgver=r8.aeeb2d2
pkgrel=1
pkgdesc="*nixy filter that adds color to its standard input by rows or (space separated) columns"
arch=('any')
url="https://github.com/lonetwin/colorize"
license=('MIT')
provides=('colorize')
conflicts=('colorize')
depends=('python')
makedepends=('git')
source=('git://github.com/lonetwin/colorize.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgdir"
  install -dm0755 usr/bin/
  install -m0755 "$srcdir"/"$_gitname"/colorize.py usr/bin/colorize
  install -Dm0644 "$srcdir"/"$_gitname"/LICENSE usr/share/licenses/colorize/LICENSE
  install -Dm0644 "$srcdir"/"$_gitname"/README.rst usr/share/doc/colorize/README.rst
}
