# Contributor: Timo Schmiade <the_isz@gmx.de>
pkgname=gitstats-git
pkgver=293.e35fea2
pkgrel=1
pkgdesc="A statistics generator for git repositories."
arch=("any")
url="http://gitstats.sourceforge.net"
license=('GPL3')
depends=('git' 'python2' 'gnuplot')
source=("git+https://github.com/hoxu/gitstats.git")
md5sums=("SKIP")

pkgver() {
  cd gitstats
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd gitstats

  make install PREFIX="$pkgdir/usr"
  sed -i -e '1s/$/2/' "$pkgdir/usr/bin/gitstats"
} 

# vim:set ts=2 sw=2 et:
