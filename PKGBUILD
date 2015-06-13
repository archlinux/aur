# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Corinne Schrickel <siren@huntemann.uni-oldenburg.de>
pkgname=discus
pkgver=0.2.9
pkgrel=3
pkgdesc="A text-mode disk space usage program which aims to make df(1) prettier"
#url="http://www.raincrazy.com/software/discus/"
url="http://www.debianhelp.co.uk/discus.htm"
arch=('any')
license=("GPL")
depends=('python2')
#source=(http://www.raincrazy.com/software/discus/$pkgname-$pkgver.tar.gz)
#source=(http://www.sfr-fresh.com/unix/privat/$pkgname-$pkgver.tar.gz)
source=(http://kmkeen.com/tmp/$pkgname-$pkgver.tar.gz)
md5sums=('bcc4a08d03a0952b0b744655c45b04b8')

package() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/bin/python|/usr/bin/env python2|' discus
  install -D -m755 discus   "$pkgdir/usr/bin/discus"
  install -D -m644 discusrc "$pkgdir/etc/discusrc"
  install -D -m644 discus.1 "$pkgdir/usr/man/man1/discus.1"
}


