# Contributor: Krystian Chachuła <krystiancha@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dex-git
pkgver=0.8.0.r38.gd68c5d0
pkgrel=1
epoch=1
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
  echo $(git describe | cut -c2- | sed 's+-+.r+'| tr - .)
}

package() {
  cd dex
  make install PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir"
  rm "$pkgdir/usr/share/doc/dex/LICENSE"
}
