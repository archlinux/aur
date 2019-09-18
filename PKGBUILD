# Maintainer: Krystian Chachuła <krystiancha@gmail.com>

pkgname=dex-git
pkgver=83.864be05
pkgrel=1

pkgdesc='Program to generate and execute DesktopEntry files of type Application'
url='https://github.com/jceb/dex'
arch=('any')
license=('GPL2')

depends=('python')
makedepends=('git' 'python-sphinx')

provides=('dex')
conflicts=('dex')

source=("git+https://github.com/jceb/dex.git")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dex"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd dex
  make install PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir"
  rm "$pkgdir/usr/share/doc/dex/LICENSE"
}

# vim:set ts=2 sw=2 et:
