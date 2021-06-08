# maintainer: libele <libele@disroot.org>
# http://advent.jenandcal.familyds.org/#RUSS0000

pkgname=advent
pkgver=0
pkgrel=4
pkgdesc="WELCOME TO ADVENTURE!!"
arch=('i686' 'x86_64')
url='http://www.russotto.net/~mrussotto/ADVENT/'
license=('none')
optdepends=("bsd-games: for crowther and woods' adventure")
source_i686=("https://archive.org/download/adv-0/advent-i686.tar.gz")
source_x86_64=("https://archive.org/download/adv-0/advent-x86_64.tar.gz")
md5sums_i686=('66e3565d19c67be525ff32affbd104af')
md5sums_x86_64=('24fe4965f8c8fa57ed3d95e14815d6e5')

package() {
  cd "$srcdir/advent"

  install -Dm644 adv.dat $pkgdir/usr/share/$pkgname/adv.dat
  install -Dm755 advent $pkgdir/usr/share/$pkgname/$pkgname
  install -Dm755 libg2c.so.0 $pkgdir/usr/lib/libg2c.so.0

  cd $srcdir
  echo '#!/bin/sh' > $pkgname.sh
  echo 'cd /usr/share/advent' >> $pkgname.sh
  echo './advent' >> $pkgname.sh
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
