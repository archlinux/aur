# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=datastat-git
pkgver=20131228
pkgrel=1
pkgdesc="Simple command line statistics"
url="http://sourceforge.net/projects/datastat/"
license=("GPL3")
arch=('i686' 'x86_64')
makedepends=('git')
depends=('readline')
source=("git://git.code.sf.net/p/datastat/code")
md5sums=('SKIP')

pkgver() {
  cd code 
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd code
  make datastat
}

check() {
  cd code
  make tests
}

package() {
  cd code
  install -Dm755 datastat "$pkgdir/usr/bin/datastat"
  install -Dm644 datastat.1 "$pkgdir/usr/share/man/man1/datastat.1"
}

